# :earth_asia: Default Community workflow

## Anatomy of Public Community methodology

![community-workflow](/static/workflow/community-workflow.png){ loading=lazy }

## List all flow available

```shell
$ osmedeus utils workflow

Found 19 available workflows at: /Users/j3ssie/osmedeus-base/workflow

+------------------+------------------------------------------------------------------------------+
|    Flow Name     |                                 Description                                  |
+------------------+------------------------------------------------------------------------------+
| cidr             | Scan for CIDR File                                                           |
| domains          | run normal routine but without subdomain scan                                |
| evuln            | run fast routine with vuln scan + portscan                                   |
| extensive-vuln   | run extensive vuln scan                                                      |
| extensive        | run extensive routine with more in-depth module                              |
| fast             | run fast routine for summary data                                            |
| general          | run normal routine                                                           |
| gently-cidr      | Scan for CIDR File                                                           |
| gently-extensive | run extensive routine but with very low threads                              |
| gently-general   | run normal routine but with very low threads                                 |
| gently-host      | Scan for List of Hosts file (e.g: 1.2.3.4:443)                               |
| gently-urls      | Scan for List of URLs                                                        |
| ossub            | run extensive routine with only subdomain enumeration and subdomain takeover |
| osub             | run general routine with only subdomain enumeration                          |
| quick-cidr       | Scan for CIDR File but focus on common HTTP Ports                            |
| sync             | Sync result based on git                                                     |
| urls             | Scan for List of URLs                                                        |
| vuln-and-dirb    | directly run on vuln scan and directory scan on list of domains              |
| vuln             | run fast routine with vuln scan                                              |
+------------------+------------------------------------------------------------------------------+

Usage:
 osmedeus scan -f [flowName] -t [target]

------------------------------------------------------------

Found 3 default modules at: /Users/j3ssie/osmedeus-base/workflow/default-modules

+-------------+-------------------------------+
| Module Name |          Description          |
+-------------+-------------------------------+
| dirbscan    | Run Dirbscan                  |
| probing     | mostly for testing chunk mode |
| vulnscan    | Run common Jaeles Signature   |
+-------------+-------------------------------+

Module Usage:
 osmedeus scan -m [moduleName] -t [target]
```