# :writing_hand_tone1: Customize your own workflow

!!! Warning "All Workflow files are YAML-based so make sure you follow the YAML syntax. Otherwise, it wouldn't work"

!!! info "What is the `{{Binaries}}` in the workflow?"
    `{{Binaries}}` will be replaced with `~/osmedeus/binaries/` where I store all the binaries for running the workflow . If you already install it in your $PATH environment variable then you can just use the tool directly like `your-tool -t {{Target}}` instead of  `{{Binaries}}/your-tool -t {{Target}}`

After the installation process is finished, your workflow will be stored at `~/osmedeus-base/workflow`.


## 1. Tweaking commands or threads of the tool depends on your machine specification

You can start tweaking the workflow right away by edit any command in module file at `~/osmedeus-base/workflow/general/` folder.

For example you can edit the thread of ffuf command **[here](https://github.com/osmedeus/osmedeus-workflow/blob/main/general/dirbscan.yaml#L13)** on dirbscan module

```yaml
# --snippet--

params:
  - inputFile: "{{Output}}/probing/http-{{Workspace}}.txt"
### You can start customizing the command here with the wordlist or the threads of ffuf tool
  - wordlists: "{{Data}}/wordlists/content/small.txt"
  - ffThreads: '20' # threads for single site
### 
  - dirbThreads: '10'
  - lines: "20"
  - dlimit: '50000'
  - recursion: '0'
  - commitLength: '400'
  - chan: '#mics'

pre_run:
  - CreateFolder("{{Output}}/directory")

steps:
  # check if the size is too big, We don't want tons of garbage here
  - conditions:
      - "FileLength('{{inputFile}}') > {{dlimit}}"
    scripts:
      - ErrPrintf("Filter", "Got input file greater than {{dlimit}} line")
      - Exit(1)

  - required:
      - "{{Binaries}}/ffuf"
      - "{{inputFile}}"
    source: "{{inputFile}}"
    threads: '{{dirbThreads}}'
    commands:
      - "{{Binaries}}/ffuf -t {{ffThreads}} -timeout 15 -ac -fc '429,403,404' -D -e 'asp,aspx,pl,php,html,htm,jsp,cgi' -of json -o {{Output}}/directory/raw-[[._id_]].json -u '[[.line]]/FUZZ' -w {{wordlists}}:FUZZ"

# --snippet--

```


<hr>

You can also use the `force-params: true` in flow file to override the threads in module file like **[this flow](https://github.com/osmedeus/osmedeus-workflow/blob/main/gently-extensive.yaml)**

```yaml
name: gently-extensive
desc: run extensive routine but with very low threads
type: general
validator: domain
force-params: true

params:
  - subfinderThreads: "20"
  # probing
  - dnsThreads: "300"
  - httpThreads: "30"
  - massdnsRateBrute: "300"
  # screenshot
  - screenThreads: "8"
  # fingerprint & spider
  - ssthreads: "30"
  - overviewThreads: '30'
  - stoThreads: '30'
  - spiderThreads: "5"

  # vulnscan
  - nucleiThreads: "30"
  - jaelesThreads: "20"
  # dirbscan
  - ffThreads: '20' # threads for single ffuf-scan
  - dirbThreads: '2' # how many ffuf run at the same time
  # portscan
  - ports: "0-65535"
  - rateRustScan: "5000"
  - nmapThreads: "10"

routines:
  - flow: 'extensive'
    modules:
      - subdomain
  - flow: 'extensive'
    modules:
      - probing
  - flow: 'extensive'
    modules:
      - ssame
  - modules:
      - screenshot
  - modules:
      - sto
      - fingerprint
  - flow: 'extensive'
    modules:
      - spider
      - archive
  - modules:
      - ipspace
  - modules:
      - vulnscan

  - modules:
      - portscan

  - flow: 'extensive'
    modules:
      - dirbscan

  - flow: 'extensive'
    modules:
      - port-fingerprint
      - pvulnscan # doing vulnscan + dirbscan on portscan result too
```

<hr>

## 2. Fork another one from community workflow

Fork this repo from here [**https://github.com/osmedeus/osmedeus-workflow**](https://github.com/osmedeus/osmedeus-workflow) and change anything you want and put it to `~/osmedeus-base/workflow` folder.

or you can put it in a custom folder then use this command.

```shell
osmedeus scan --wfFolder ~/custom-workflow/ -f your-custom-workflow -t sample.com
```

<hr>


## 3. Add your new tool to existing workflow

For example, you have a new tool for subdomain enumeration called `awesome-subdomain-enum` and the usage of it is like `awesome-subdomain-enum -t sample.com -o output.txt`.

You can easily add it to the existing workflow by adding the following command `awesome-subdomain-enum -t {{Target}} >> {{Output}}/subdomain/sum-{{Workspace}}.txt` to the [**subdomain.yaml**](https://github.com/osmedeus/osmedeus-workflow/blob/main/general/subdomain.yaml#L30) file at `~/osmedeus-base/workflow/general/subdomain.yaml`.


```yaml
# --snippet--

steps:
  - required:
      - "{{Binaries}}/amass"
      - "{{Binaries}}/subfinder"
      - "{{Binaries}}/assetfinder"
      - "{{Binaries}}/findomain"
    commands:
      - "timeout -k 1m {{amassTimeout}} {{Binaries}}/amass enum -config {{amassConfig}} -silent -nocolor -d {{Target}} -o {{Output}}/subdomain/{{Workspace}}-raw-amass.txt > /dev/null 2>&1"
      - "{{Binaries}}/assetfinder -subs-only {{Target}} > {{Output}}/subdomain/{{Workspace}}-assetfinder.txt"
  # these 3 commands will run in parallels
  - commands:
      - "{{Binaries}}/findomain -u {{Output}}/subdomain/{{Workspace}}-findomain.txt -t {{Target}} > /dev/null 2>&1"
      - "{{Binaries}}/subfinder -d {{Target}} -t {{subfinderThreads}} -o {{Output}}/subdomain/{{Workspace}}-subfinder.txt > /dev/null 2>&1"
      # your new tool here
      - "awesome-subdomain-enum -t {{Target}} >> {{Output}}/subdomain/sum-{{Workspace}}.txt"

# --snippet--
```


<hr>

## 4. Writing a new flow

Create a new flow file at `~/osmedeus-base/workflow/your-workflow.yaml` by customize the [**general**](https://github.com/osmedeus/osmedeus-workflow/blob/main/general.yaml) flow file.


!!! tips "If you want to use your own modules, you can change the `type: general` to `type: you-workflow` specify the folder of your modules."


```yaml
name: your-workflow
desc: run subdomain enumeration and content discovery
type: general # this is mean module file will be read from `~/osmedeus-base/workflow/general/` folder
validator: domain

routines:
  - modules:
      - subdomain
  - modules:
      - probing
  - modules:
      - dirbscan
```

Now you can run your workflow with this command `osmedeus scan -f your-workflow -t sample.com`

<hr>

## 5. Writing a new module

## 5.1 Write your custom module `your-module.yaml`

Create a new module file at `~/osmedeus-base/workflow/general/your-module.yaml`.

```yaml
name: your-module
desc: Finding archive URLs from Github

report:
  final:
    - "{{Output}}/archive/{{Workspace}}-archive.txt"

params:
  - httpFile: "{{Output}}/probing/http-{{Workspace}}.txt"
  - archiveTimeout: "1h"

pre_run:
  - CreateFolder("{{Output}}/archive")

steps:
  - required:
      - "{{Binaries}}/github-endpoints"
      - "{{Binaries}}/durl"
    # @NOTE: github-endpoints require you to setup your own github token
    commands:
      - "{{Binaries}}/github-endpoints -raw -e -all -d {{Target}} -o {{Output}}/archive/raw-{{Workspace}}-archive.txt | {{Binaries}}/durl | shuf -n {{alimit}} >> {{Output}}/archive/{{Workspace}}-archive.txt"
    scripts:
      - "SortU('{{Output}}/archive/{{Workspace}}-archive.txt')"

```

Now you can run your workflow with this command `osmedeus scan -f general -t sample.com`

## 5.2 Add a new module to exsting workflow

Adding a new module file to the `general.yaml` flow file.

```yaml
name: general
desc: run normal routine
type: general
validator: domain

routines:
  - modules:
      - subdomain
  - modules:
      - probing
  - modules:
      - fingerprint
  - modules:
      - screenshot
  - modules:
      - spider
  - modules:
      - sto
      - archive
      - ipspace
  - modules:
      - vulnscan
  - modules:
      - dirbscan
  - modules:
      - portscan
  - modules:
      - your-module

```