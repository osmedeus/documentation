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

## scan - Actually start a scan based on predefined flow

## server - Start web UI server

## utils - Utility to get some information from the system

## health - Run diagnostics to check configurations

*** 

## cloud - Run scan in Distributed Cloud mode