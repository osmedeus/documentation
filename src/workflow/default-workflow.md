# :earth_asia: Default Community workflow

## Anatomy of Public Community methodology

![community-workflow](/static/workflow/community-workflow.png){ loading=lazy }

## List all flow available

```shell
$ osmedeus workflow ls

Found 11 available workflows at: /Users/j3ssie/osmedeus-base/workflow

+----------------+-------------------------------------------------------------------------------------------------------+
|   Flow Name    |                                              Description                                              |
+----------------+-------------------------------------------------------------------------------------------------------+
| cidr           | Scanning for CIDR File                                                                                |
| domains        | Performing the default routine using the provided list of domains, but skipping subdomain enumeration |
| extensive-vuln | Running extensive vuln scan                                                                           |
| extensive      | Running extensive reconnaissance routine with in-depth module + bigger wordlists                      |
| fast           | Performing a quick summary data analysis                                                              |
| general        | Running default reconnaissance routine                                                                |
| quick-cidr     | Scanning for CIDR file but focus on common HTTP Ports and skip banner grabbing                        |
| subdomain-enum | Running subdomain enumeration and dns resolving only                                                  |
| urls           | Performing vulnerability scan and directory scan using the provided Domains, URLs or IP Address       |
| vuln-and-dirb  | Running vulnerability scan and directory scan on list of provded domains                              |
| vuln           | Performing a rapid routine and conducting a vulnerability scan on it                                  |
+----------------+-------------------------------------------------------------------------------------------------------+

Usage:
 osmedeus scan -f [flowName] -t [target]

------------------------------------------------------------

Found 8 default modules at: /Users/j3ssie/osmedeus-base/workflow/default-modules

+-----------------------+-------------------------------------------------------------------------------------------------------------------+
|      Module Name      |                                                    Description                                                    |
+-----------------------+-------------------------------------------------------------------------------------------------------------------+
| brutefocing-subdomain | Running Subdomain Brutefocing on provided domain                                                                  |
| cidr-probing          | Conducting common Port scanning then doing HTTP fingerprint technology and response with the supplied CIDR inputs |
| content-discovery     | Running content discovery with the supplied inputs                                                                |
| http-probing          | Running HTTP fingerprint technology and response with the supplied inputs                                         |
| repo-scan             | Performing static vulnerability scan and secret scan on a git repo                                                |
| spidering             | Crawling links in http site + scanning for secrets with trufflehog                                                |
| subdomain-enum        | Running subdomain enumeration                                                                                     |
| vuln-scan             | Run quick vulnerability scan with provided inputs                                                                 |
+-----------------------+-------------------------------------------------------------------------------------------------------------------+

Module Usage:
 osmedeus scan -m [moduleName] -t [target]

💡 For full help message, please run: osmedeus --hh or osmedeus scan --hh
```