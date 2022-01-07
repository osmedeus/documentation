# :brain: Understand the workflow

Workflow is the core of the Osmedeus Engine which represents your methodology as YAML files.

![routine-detail](static/workflow/routine-detail.png){ loading=lazy }

!!! Warning "All Workflow files are YAML-based so make sure you follow the YAML syntax. Otherwise, it wouldn't work"

- **Module** contains detail of multiple step.
- **Flow** contains multiple module and also define order how to run these modules.
- **Step** is smallest part of the Osmedeus routine.

## Flow

```yaml
name: general
desc: run normal routine
type: general # this is a folder name that will contains module file
validator: domain # validate the input provide from -t option

routines:
  - modules:
      - subdomain
  - modules:
      - probing
  - modules:
      - ssame
  - modules:
      - screenshot
  - modules: # these module will be run in parallel
      - fingerprint
      - spider
      - sto
  - modules:  # these module will be run in parallel
      - archive
      - ipspace
  - modules:
      - vulnscan
  - modules:
      - vhostscan
  - modules:
      - portscan
  - modules:
      - pdirbscan
  - modules:
      - dirbscan
  # push final result again
  - modules:
      - summary

```

## Module

### [subdomain module](https://github.com/osmedeus/osmedeus-workflow/blob/main/general/subdomain.yaml)
```yaml
name: subdomain
desc: Scanning for subdomain

report:
  final:
    - "{{.Output}}/subdomain/final-{{.Workspace}}.txt"
    - "{{.Output}}/subdomain/more-{{.Workspace}}.txt"

# {{.Output}} == {{.Workspaces}} + {{.Workspace}} but strip "/" char
pre_run:
  - CreateFolder("{{.Storages}}/subdomain/{{.Workspace}}/")
  - CreateFolder("{{.Storages}}/summary/{{.Workspace}}/")
  - CreateFolder("{{.Output}}/subdomain/")

params:
  - subthreads: "50"
  - amassTimeout: "3h"

steps:
  - required:
      - "{{.Binaries}}/amass"
      - "{{.Binaries}}/subfinder"
      - "{{.Binaries}}/assetfinder"
      - "{{.Binaries}}/findomain"
    commands:
      - "timeout -k 1m {{.amassTimeout}} {{.Binaries}}/amass enum -config {{.Data}}/configs/amass.ini -d {{.Target}} -o {{.Output}}/subdomain/{{.Workspace}}-amass.txt > /dev/null 2>&1"
      - "{{.Binaries}}/assetfinder -subs-only {{.Target}} > {{.Output}}/subdomain/{{.Workspace}}-assetfinder.txt"
  # these two commands will run in parallels
  - commands:
      - "{{.Binaries}}/findomain -u {{.Output}}/subdomain/{{.Workspace}}-findomain.txt -t {{.Target}} > /dev/null 2>&1"
      - "{{.Binaries}}/subfinder -d {{.Target}} -t {{.subthreads}} -o {{.Output}}/subdomain/{{.Workspace}}-subfinder.txt > /dev/null 2>&1"

  # cleaning some result
  - scripts:
      - Append("{{.Output}}/subdomain/sum-{{.Workspace}}.txt", "{{.Output}}/subdomain/{{.Workspace}}-amass.txt")
      - Append("{{.Output}}/subdomain/sum-{{.Workspace}}.txt", "{{.Output}}/subdomain/{{.Workspace}}-subfinder.txt")
      - Append("{{.Output}}/subdomain/sum-{{.Workspace}}.txt", "{{.Output}}/subdomain/{{.Workspace}}-assetfinder.txt")
      - Append("{{.Output}}/subdomain/sum-{{.Workspace}}.txt", "{{.Output}}/subdomain/{{.Workspace}}-findomain.txt")
      # remove junk subdomain like sample@subdomain.com and 1-2-3.subdomain.com format
      - ExecCmd("cat {{.Output}}/subdomain/sum-{{.Workspace}}.txt | {{.Binaries}}/cleansub -t '{{.Target}}' > {{.Output}}/subdomain/final-{{.Workspace}}.txt")
  - scripts:
      - SortU("{{.Output}}/subdomain/final-{{.Workspace}}.txt")

  # get more related domains
  - required:
      - "{{.Binaries}}/metabigor"
    # assume you run 'osmedeus scan -t example.com' then {{.Org}} == 'example'
    commands:
      - "echo '{{.Org}}' | {{.Binaries}}/metabigor cert --json -o {{.Output}}/subdomain/more-json-{{.Workspace}}.txt"
    scripts:
      - ExecCmd("cat {{.Output}}/subdomain/more-json-{{.Workspace}}.txt | jq -r '.Domain' | sed 's/\*.//g' | sort -u > {{.Output}}/subdomain/more-{{.Workspace}}.txt")

post_run:
  # delete all files in workspaces folder except a file lists in report section
  - Cleaning("{{.Output}}/subdomain/")

```

***

### [subdomain module](https://github.com/osmedeus/osmedeus-workflow/blob/main/general/dirbscan.yaml)

```yaml
name: dirbscan
desc: Run Dirbscan

report:
  final:
    - "{{.Output}}/directory/beautify-{{.Workspace}}.txt"
    - "{{.Output}}/directory/paths-{{.Workspace}}.csv"

params:
  - inputfile: "{{.Output}}/probing/http-{{.Workspace}}.txt"
  - wordlists: "{{.Data}}/wordlists/content/small.txt"
  - lines: "20"
  - fthreads: '20' # threads for single site
  - dirbThreads: '10'
  - dlimit: '50000'
  - recursion: '0'
  - commitLength: '400'
  - chan: '#mics'

pre_run:
  - CreateFolder("{{.Storages}}/paths/{{.Workspace}}")
  - CreateFolder("{{.Output}}/directory")

steps:
  # check if the size is too big, We don't want tons of garbage here
  - conditions:
      - "FileLength('{{.inputfile}}') > {{.dlimit}}"
    scripts:
      - ErrPrintf("Filter", "Got input file greater than {{.dlimit}} line")
      - Exit(1)

  # # make a header for csv file
  # - commands:
  #     - echo 'url,status,length,words,lines,redirectlocation' > {{.Output}}/directory/beautify-{{.Workspace}}.csv

  - required:
      - "{{.Binaries}}/ffuf"
      - "{{.inputfile}}"
    source: "{{.inputfile}}"
    threads: '{{.dirbThreads}}'
    commands:
      - "{{.Binaries}}/ffuf -t {{.fthreads}} -timeout 15 -ac -fc '429,403,404' -D -e 'asp,aspx,pl,php,html,htm,jsp,cgi' -of json -o {{.Output}}/directory/raw-{{._id_}}.json -u '{{.line}}/FUZZ' -w {{.wordlists}}:FUZZ"
    scripts:
      # get result in csv
      - ExecCmd("cat {{.Output}}/directory/raw-{{._id_}}.json | jq -r '.results[] | [.url,.status,.length,.words,.lines,.redirectlocation] | join(\",\")' > {{.Output}}/directory/raw-{{._id_}}-{{.Workspace}}.csv")
      # join to final result
      - ExecCmd("cat {{.Output}}/directory/raw-{{._id_}}-{{.Workspace}}.csv >> {{.Output}}/directory/beautify-{{.Workspace}}.csv")
      # noti small file to telegram
      - ExecCmd("cat {{.Output}}/directory/raw-{{._id_}}-{{.Workspace}}.csv | {{.Binaries}}/csvtk pretty -I -s ' | ' -W 75 > {{.Output}}/directory/beautify-{{._id_}}-{{.Workspace}}.txt")
      - TeleMessByFile("{{.chan}}", "{{.Output}}/directory/beautify-{{._id_}}-{{.Workspace}}.txt")
      # sorting & clean up
      - SortU("{{.Output}}/directory/beautify-{{.Workspace}}.csv")
      - ExecCmd("rm -rf {{.Output}}/directory/beautify-{{._id_}}-{{.Workspace}}.txt {{.Output}}/directory/raw-{{._id_}}-{{.Workspace}}.csv {{.Output}}/directory/raw-{{._id_}}.json {{.Output}}/directory/unique-{{._id_}}.json")
    # generate final beautify every 400 domains has been scanned
    pconditions:
      - "({{._id_}} % {{.commitLength}}) == 0"
    pscripts:
      - ExecCmd("cat {{.Output}}/directory/beautify-{{.Workspace}}.csv | {{.Binaries}}/csvtk pretty -I -s ' | ' -W 75 > {{.Output}}/directory/beautify-{{.Workspace}}.txt")
      - ExecCmd("cat {{.Output}}/directory/beautify-{{.Workspace}}.txt >> {{.Storages}}/paths/{{.Workspace}}/beautify-{{.Workspace}}.txt")
      - PushFolder("{{.Storages}}/paths/")

  # clean up and notify to summary channel
  - required:
      - "{{.Output}}/directory/beautify-{{.Workspace}}.csv"
    scripts:
      - ExecCmd("cat {{.Output}}/directory/beautify-{{.Workspace}}.csv | {{.Binaries}}/csvtk pretty -I -s ' | ' -W 75 > {{.Output}}/directory/beautify-{{.Workspace}}.txt")
      - ExecCmd("cat {{.Storages}}/paths/{{.Workspace}}/paths-{{.Workspace}}.csv | {{.Binaries}}/csvtk pretty -I -s ' | ' -W 75 > {{.Storages}}/paths/{{.Workspace}}/beautify-{{.Workspace}}.txt")
      - TeleMessByFile("#dirb", "{{.Output}}/directory/beautify-{{.Workspace}}.txt")
      - ExecCmd('cat {{.Output}}/directory/beautify-{{.Workspace}}.txt')

post_run:
  - TotalDirb("{{.Output}}/directory/beautify-{{.Workspace}}.txt")
  - PushFolder("{{.Storages}}/paths/")

```


## Step


```yaml
steps: # all step run in serial

 # variation 1 
  - required: # Check if all the files exist or the step will not run
      - filename-1-here.txt
      - filename-2-here.txt

    conditions: # Boolean conditions check with built-in scripts
      - "FileLength('filename.txt') > 1000"

    commands: # unix command and it will be run in parallel
      - "unix command 1 here"
      - "unix command 2 here"
    scripts: 
      - ExecCmd("unix command 3 heret") # command 3 and 4 below it will be run in serial
      - ExecCmd("unix command 4 here")
      - SortU("filename-here.txt")
      - TeleMessByFile("#dirb", "beautify-{{.Workspace}}.txt")

    ## only run if conditions is false
    rcommands: # run in parallel
      - "unix command 1 here"
      - "unix command 2 here"
    rscripts:
      - ErrPrintf("Filter", "Got input file greater than 1000 line")
      - Exit(1)

 #########################
 
 # variation 2 that will run the step but with input is each like of 'source' section
  - source: "{{.inputfile}}" # source file to loop through
    threads: '{{.dirbThreads}}'
    commands:
      - "{{.Binaries}}/go/ffuf-mod -H 'X-Forwarded-For: 127.0.0.1' -t {{.fthreads}} -recursion-depth {{.recursion}} -D -e 'asp,aspx,php,html,htm,jsp,cgi' -timeout 15 -get-hash -ac -s -fc '429,404,400' -of json -o {{.Output}}/directory/raw-{{._id_}}.json -u '{{.line}}/FUZZ' -w {{.wordlists}}:FUZZ"
    scripts:
      - SortU("{{.Storages}}/paths/{{.Workspace}}/paths-{{.Workspace}}.csv")
```
