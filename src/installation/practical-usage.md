
# :fire: Practical Scan Usage Cheatshet - Ready to use workflow has been heavily tested in real world target.

!!! tips "You can slowdown or speedup the scan by provide a `--tactic` or `--threads-hole` command line flag?"
    By default the threads hold for the workflow will equals of your number of CPUs, but you can change it by using `--threads-hold=20`. You can also use  `--tactic=gently` flag to slowdown or the `--tactic=aggressive` speedup the scan.

!!! danger "To avoid encountering errors, it is important to ensure that the scan is executed using the correct input format."

Default workflow sthat come with Osmedeus Premium Package are:

| Input Type |    Flow Name         |                                 Description                                  |          Example Commands                   
|:-----------|:---------------------|:-----------------------------------------------------------------------------|:-----------------------------------|
| single tld (e.g: `example.com`)  | **general** (default)         | run normal routine                              | `osmedeus scan -f general -t example.com`               |
|            | **extensive**        | run extensive routine with more in-depth module                              | `osmedeus scan -f extensive -t example.com`               |
|            | **vuln**             | run fast routine with vuln scan                                              | `osmedeus scan -f vuln -t example.com`                |
|            | **fast**             | run fast routine for summary data                                            | `osmedeus scan -f fast -t example.com`                |
|            | **subdomain-enum**             | Running subdomain enumeration and dns resolving only                          | `osmedeus scan -f subdomain-enum -t example.com`                |
|            | **extensive-vuln**   | run extensive vuln scan                                                      | `osmedeus scan -f extensive-vuln -t example.com`                |
| <hr> | <hr> | <hr> | <hr> |
| a file contains a list of domains (line format: `example.com` or `sub.example.com`)          | **domains**          | run normal routine but without subdomain scan                 | `osmedeus scan -f domains -t list-of-domains.txt`           |
|            | **vuln-and-dirb**    | directly run on vuln scan and directory scan on list of domains              | `osmedeus scan -f vuln-and-dirb -t list-of-http.txt`  |
| <hr> | <hr> | <hr> | <hr> |
| A file contains a list of URL | **urls**             | Scanning for List of Domains, URLs or IP Address                                                        | `osmedeus scan -f urls -t list-of-urls.txt`           |
| <hr> | <hr> | <hr> | <hr> |
| A file contains a list of CIDR or a single CIDR  | **cidr**             | Scan for CIDR File                                          | `osmedeus scan -f cidr -t /tmp/list_of_cidrs.txt` |
|                                 | **quick-cidr**       | Scan for CIDR File but focus on common HTTP Ports                            | `osmedeus scan -f quick-cidr -t 1.2.3.4/24` or `osmedeus scan -f quick-cidr -t list-of-cidr.txt` |



# What is it running behind the scene?

<figure markdown> 
    ![general workflow](https://raw.githubusercontent.com/osmedeus/assets/main/general-workflow-mindmap.png)
    By default the tool will run a general workflow from [**this page**](https://github.com/osmedeus/osmedeus-workflow).
</figure>

