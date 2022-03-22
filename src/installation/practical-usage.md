# :fire: Practical Usage - Ready to use workflow has been heavily tested in real world target.

!!! danger "Make sure run the scan with correct input format otherwise you will get an error."

Default workflow sthat come with Osmedeus Premium Package are:

| Input Type |    Flow Name         |                                 Description                                  |          Example Commands                   
|:-----------|:---------------------|:-----------------------------------------------------------------------------|:-----------------------------------|
| single tld (e.g: `example.com`)  | **general** (default)         | run normal routine                              | `osmedeus scan -f general -t example.com`               |
|            | **extensive**        | run extensive routine with more in-depth module                              | `osmedeus scan -f extensive -t example.com`               |
|            | **gently-extensive** | run extensive routine but with very low threads                              | `osmedeus scan -f gently-extensive -t example.com`               |
|            | **gently-general**   | run normal routine but with very low threads                                 | `osmedeus scan -f gently-general -t example.com`               |
|            | **vuln**             | run fast routine with vuln scan                                              | `osmedeus scan -f vuln -t example.com`                |
|            | **fast**             | run fast routine for summary data                                            | `osmedeus scan -f fast -t example.com`                |
|            | **osub**             | run general routine with only subdomain enumeration                          | `osmedeus scan -f osub -t example.com`                |
|            | **extensive-vuln**   | run extensive vuln scan                                                      | `osmedeus scan -f extensive-vuln -t example.com`                |
| <hr> | <hr> | <hr> | <hr> |
| a file contains a list of domains (line format: `example.com` or `sub.example.com`)          | **domains**          | run normal routine but without subdomain scan                 | `osmedeus scan -f domains -t list-of-domains.txt`           |
|            | **vuln-and-dirb**    | directly run on vuln scan and directory scan on list of domains              | `osmedeus scan -f vuln-and-dirb -t list-of-http.txt`  |
|            | **gently-host**      | Scan for List of Hosts file (e.g: 1.2.3.4:443)                               | `osmedeus scan -f gently-host -t list-of-host-with-ports.txt` (sample input lines: `1.2.3.4:443`)               |
| <hr> | <hr> | <hr> | <hr> |
| <hr> | <hr> | <hr> | <hr> |
| A file contains a list of URL | **urls**             | Scan for List of URLs                                                        | `osmedeus scan -f urls -t list-of-urls.txt`           |
|                               | **gently-urls**      | Scan for List of URLs                                                        | `osmedeus scan -f gently-urls -t list-of-urls.txt`               |
| <hr> | <hr> | <hr> | <hr> |
| A file contains a list of CIDR or a single CIDR  | **cidr**             | Scan for CIDR File                                          | `osmedeus scan -f cidr -t /tmp/list_of_cidrs.txt` |
|                                 | **gently-cidr**      | Scan for CIDR File but with very low threads                                 | `osmedeus scan -f gently-cidr -t example.com`               |
|                                 | **quick-cidr**       | Scan for CIDR File but focus on common HTTP Ports                            | `osmedeus scan -f quick-cidr -t 1.2.3.4/24` or `osmedeus scan -f quick-cidr -t list-of-cidr.txt` |