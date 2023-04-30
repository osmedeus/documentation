# Usage - Full usage message

<figure markdown> 
  ![Usage](/static/images/usage.png)
</figure>

## Practical Usage with examples commands

```shell
## Start a simple scan with default 'general' flow
osmedeus scan -t sample.com

## Start a general scan but exclude some of the module
osmedeus scan -t sample.com -x screenshot -x spider

## Start a scan directly with a module with inputs as a list of http domains like this https://sub.example.com
osmedeus scan -m content-discovery -t http-file.txt

## Initiate the scan using a speed option other than the default setting
osmedeus scan -f vuln --tactic gently -t sample.com
osmedeus scan --threads-hold=10 -t sample.com

## Start a simple scan with other flow
osmedeus scan -f vuln -t sample.com
osmedeus scan -f extensive -t sample.com -t another.com
osmedeus scan -f urls -t list-of-urls.txt

## Scan list of targets
osmedeus scan -T list_of_targets.txt
osmedeus scan -f vuln -T list-of-targets.txt

## Performing static vulnerability scan and secret scan on a git repo
osmedeus scan -m repo-scan -t https://github.com/j3ssie/sample-repo
osmedeus scan -m repo-scan -T list-of-repo.txt

## Scan for CIDR with file contains CIDR with the format '1.2.3.4/24'
osmedeus scan -f cidr -t list-of-ciders.txt
osmedeus scan -f cidr -t '1.2.3.4/24' # this will auto convert the single input to the file and run

## Directly run on vuln scan and directory scan on list of domains
osmedeus scan -f domains -t list-of-domains.txt
osmedeus scan -f vuln-and-dirb -t list-of-domains.txt

## Use a custom wordlist
osmedeus scan -t sample.com -p 'wordlists={{Data}}/wordlists/content/big.txt'

## Use a custom wordlist
cat list_of_targets.txt | osmedeus scan -c 2

## Start a normal scan and backup entire workflow folder to the backup folder
osmedeus scan --backup -f domains -t list-of-subdomains.txt

## Start the scan with chunk inputs to review the output way more much faster
osmedeus scan --chunk --chunk-parts 20 -f cidr -t list-of-100-cidr.txt

## Continuously run the scan on a target right after it finished
osmedeus utils cron --for --cmd 'osmedeus scan -t example.com'

💡 For full help message, please run: osmedeus scan --hh
```

## help - help about any command

```shell
osmedeus help
osmedeus --hh
osmedeus scan help
osmedeus cloud help
```

## scan - Actually start a scan based on predefined workflow

```shell
# Scan Usage:
osmedeus scan -f [flowName] -t [target]
osmedeus scan -m [modulePath] -T [targetsFile]
osmedeus scan -f /path/to/flow.yaml -t [target]
osmedeus scan -m /path/to/module.yaml -t [target] --params 'port=9200'
osmedeus scan -m /path/to/module.yaml -t [target] -l /tmp/log.log
osmedeus scan --tactic aggressive -m module -t [target]
cat targets | osmedeus scan -f sample

# Practical Scan Usage:
osmedeus scan -T list_of_targets.txt -W custom_workspaces
osmedeus scan -t target.com -w workspace_name --debug
osmedeus scan -f general -t sample.com
osmedeus scan --tactic aggressive -f general -t sample.com
osmedeus scan -f extensive -t sample.com -t another.com
cat list_of_urls.txt | osmedeus scan -f urls
osmedeus scan --threads-hold=15 -f cidr -t 1.2.3.4/24
osmedeus scan -m ~/.osmedeus/core/workflow/test/dirbscan.yaml -t list_of_urls.txt
osmedeus scan --wfFolder ~/custom-workflow/ -f your-custom-workflow -t list_of_urls.txt
osmedeus scan --chunk --chunk-part 40 -c 2 -f cidr -t list-of-cidr.txt
```


## cloud - Run scan in Distributed Cloud mode

``` shell
# Cloud Usage
osmedeus cloud -f [flowName] -t [target]
osmedeus cloud -f [flowName] -T [targetFile] --no-del
osmedeus cloud -m [modulePath] -t [target]
osmedeus cloud -c 5 -f [flowName] -T [targetsFile]
osmedeus cloud --token xxx -c 5 -f [flowName] -T [targetsFile]
osmedeus cloud --chunk -c 5 -f [flowName] -t [targetsFile]
```

## provider - Cloud utils for Distributed Mode

```shell
# Provider Usage
osmedeus provider wizard
osmedeus provider validate
osmedeus provider build --token xxx --rebuild --ic
osmedeus provider health --debug
osmedeus provider health --for
osmedeus provider create --name 'sample'
osmedeus provider delete --id 34317111 --id 34317112
osmedeus provider list
osmedeus provider clear
```

## queue - Running the scan with input from queue file

```shell
osmedeus queue -Q /tmp/queue-file.txt -c 2
osmedeus queue --add -t example.com -Q /tmp/queue-file.txt
```

## server - Start web UI server

```shell
osmedeus server --port 9000
osmedeus server -A --disable-ssl
```

## utils - Utility to get some information from the system

```shell
osmedeus version --json
## Update utilities
osmedeus update
osmedeus update --vuln
osmedeus update --force --clean
## Other utilities
osmedeus utils tmux ls
osmedeus utils tmux logs -A -l 10
osmedeus utils ps
osmedeus utils ps --osm
osmedeus utils ps --osm --kill
osmedeus utils ps --proc 'jaeles'
osmedeus utils cron --cmd 'osmdeus scan -t example.com' --sch 60
osmedeus utils cron --for --cmd 'osmedeus scan -t example.com'
osmedeus utils workflow
osmedeus config set --threads-hold=10
```

## health - Run diagnostics to check configurations

```shell
osmedeus health
osmedeus health cloud --debug
osmedeus health git --debug
```
*** 


## queue - Running the scan with input from queue file

```shell
# Report Usage
osmedeus queue -Q /tmp/queue-file.txt -c 2
osmedeus queue --add -t example.com -Q /tmp/queue-file.txt
```

## report - Show report of existing workspace

```shell
# Report Usage
osmedeus report list
osmedeus report extract -t target.com.tar.gz
osmedeus report extract -t target.com.tar.gz --dest .
osmedeus report compress -t target.com
osmedeus report view --raw -t target.com
osmedeus report view --static -t target.com
osmedeus report view --static --ip 0 -t target.com
```