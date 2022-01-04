# Usage

<figure markdown> 
  ![Usage](/static/images/usage.png)
</figure>

## Practical Usage with examples commands

```shell
# Practical Usage:
  osmedeus scan -f [flowName] -t [target]
  osmedeus scan -f [flowName] -T [targetsFile]
  osmedeus scan -f /path/to/flow.yaml -t [target]
  osmedeus scan -m /path/to/module.yaml -t [target] --params 'port=9200'
  osmedeus scan -m /path/to/module.yaml -t [target] -l /tmp/log.log
  cat targets | osmedeus scan -f sample

# Cloud Usage:
  osmedeus provider build
  osmedeus cloud -f [flowName] -t [target]
  osmedeus cloud -c 10 -f [flowName] -T [targetsFile]
  osmedeus cloud --chunk -c 10 -f [flowName] -t [targetsFile]

# Example Commands:
  osmedeus scan -t target.com
  osmedeus scan -T list_of_targets.txt -W custom_workspaces
  osmedeus scan -t target.com -w workspace_name --debug
  osmedeus scan -f single -t www.sample.com
  osmedeus scan -f ovuln-T list_of_target.txt
  osmedeus scan -m ~/osmedeus-base/workflow/test/dirbscan.yaml -t list_of_urls.txt
  osmedeus health
  ls ~/.osmedeus/storages/summary/ | osmedeus scan -m ~/osmedeus-base/workflow/test/dirbscan.yaml
  ls ~/.osmedeus/storages/summary/ | osmedeus scan -m ~/osmedeus-base/workflow/test/busting.yaml -D

# Private Documentation can be found here: https://frosty-minsky-779bed.netlify.app/introduction/

# Start Web UI at https://localhost:8000/ui/
osmedeus server
# login with credentials from `~/.osmedeus/config.yaml`

# Delete workspace
osmedeus config delete -w workspace_name
```

## help - help about any command

```shell
osmedeus help
osmedeus scan help
```

## scan - Actually start a scan based on predefined workflow

```shell
# Practical Scan Usage:

## Start a simple scan with default 'general' flow
osmedeus scan -t sample.com

## Start a general scan but exclude some of the module
osmedeus scan -t sample.com -x screenshot -x spider

## Start a simple scan with other flow
osmedeus scan -f vuln -t sample.com

## Scan for CIDR with file contains CIDR with the format '1.2.3.4/24'
osmedeus scan -f cidr -t list-of-cidrs.txt
osmedeus scan -f cidr -t '1.2.3.4/24' # this will auto convert the single input to the file and run

## Directly run on vuln scan and directory scan on list of domains
osmedeus scan -f vuln-and-dirb -t list-of-domains.txt

## Use a custom wordlist
osmedeus scan -t sample.com -p 'wordlists={{.Data}}/wordlists/content/big.txt' -p 'fthreads=40'

## Scan list of targets
osmedeus scan -T list_of_targets.txt

## Get target from a stdin and start the scan with 2 concurrency
cat list_of_targets.txt | osmedeus scan -c 2

```

## server - Start web UI server

```shell
osmedeus server --port 9000
```

## utils - Utility to get some information from the system

```shell
osmedeus utils tmux ls
osmedeus utils tmux logs -A -l 10
osmedeus utils ps
osmedeus utils ps --proc 'jaeles'
osmedeus utils cron --cmd 'osmdeus scan -t example.com' --sch 60
osmedeus utils cron --for --cmd 'osmedeus scan -t example.com'
```

## health - Run diagnostics to check configurations

```shell
osmedeus health
```
*** 

## cloud - Run scan in Distributed Cloud mode

``` shell
# Cloud Usage
  osmedeus cloud -f [flowName] -t [target]
  osmedeus cloud -m [modulePath] -t [target]
  osmedeus cloud -c 10 -f [flowName] -T [targetsFile]
  osmedeus cloud --token xxx -G -c 10 -f [flowName] -T [targetsFile]
  osmedeus cloud --chunk -c 10 -f [flowName] -t [targetsFile]
```

## provider - Cloud utils for Distributed Mode

```shell
# Provider Usage
osmedeus provider build
osmedeus provider build --token xxx --rebuild --ic
osmedeus provider create --name 'sample'
osmedeus provider health --debug
```