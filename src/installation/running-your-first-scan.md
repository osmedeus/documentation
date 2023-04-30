# :mag: Running Your First Scan

**:information_source:  Some tips before you start the scan**
!!! tips "You can slowdown or speedup the scan by provide a `--tactic` or `--threads-hole` command line flag?"
    By default the threads hold for the workflow will equals of your number of CPUs, but you can change it by using `--threads-hold=20`. You can also use  `--tactic=gently` flag to slowdown or the `--tactic=aggressive` speedup the scan.

    for example: `osmedeus scan --threads-hold=10 -t example.com`

!!! example "Running the command `osmedeus workflow ls` to show full workflow and `osmedeus scan -hh` to see the full help of the scan command"

!!! danger "To avoid encountering errors, it is important to ensure that the scan is executed using the correct input format."

<!-- # :information_source:  Some tips before you start the scan -->


## :octicons-globe-24: If you workflow is a domain or a list of subdomains

:fontawesome-solid-scroll: __Example inputs__: `example.com` , `target.co.uk`

> If your input is `sub.example.com` and you are aware that there are not many subdomains associated with it (such as `another.sub.example.com`), then it may be more advantageous to employ a different workflow.


**1. If you desire a comprehensive scan that encompasses subdomain enumeration, DNS probing, and vulnerability scanning**

:fontawesome-solid-terminal: __Example commands__
```bash
# running default flow -f 'general'
osmedeus scan -t example.com

# Running extensive reconnaissance routine with in-depth module + bigger wordlists
osmedeus scan -f extensive -t example.com
```


**2. If you desire to perform a quick summary data analysis to get subdomain and DNS probing only**

:fontawesome-solid-terminal: __Example commands__
```bash
osmedeus scan -f fast -t example.com

# only run subdomain enumeration
osmedeus scan -f subdomain-enum -t example.com

osmedeus scan -m brutefocing-subdomain -t example.com
```

**3. If you desire to perform a rapid routine and conducting a vulnerability scan on ity**

:fontawesome-solid-terminal: __Example commands__

```bash
osmedeus scan -f vuln -t example.com
```

<hr>

## :simple-curl:  If you workflow is a URL or a list of URLs

:fontawesome-solid-scroll: __Example inputs__: Your input is **a file** that includes a catalog of URLs or IP addresses, along with subdomains such as `https://sub.example.com` , `internal.app.example.com`, `https://evil.com/path`, `https://1.2.3.4`, `3.4.5.6`, etc

:warning: The workflows listed below solely permit input in the form of a file. If your input is not in the file format, kindly arrange it in a file prior to execution.

:fontawesome-solid-terminal: __Example commands__

```bash
osmedeus scan -f urls -t list-of-urls.txt

osmedeus scan -f domains -t list-of-domains.txt

# using with module
osmedeus scan -m http-probing -t list-of-domains.txt

osmedeus scan -m vuln-scan -t list-of-domains.txt

osmedeus scan -m content-discovery -t list-of-domains.txt
osmedeus scan -m content-discovery -t list-of-urls.txt
```

## :material-ip:  If you workflow is a CIDR or a list of CIDRs

:fontawesome-solid-scroll: __Example inputs__: Your input is **a file** that includes a catalog of IP addresses, CIDR such as `1.2.3.4/24` , `3.4.5.6`, etc or a simple CIDR like `1.2.3.4/24`

:fontawesome-solid-terminal: __Example commands__

```bash
osmedeus scan -f cidr -t 1.2.3.4/24

osmedeus scan -f cidr -t list-of-cidr.txt

osmedeus scan -f cidr-probing -t 3.4.5.6/24

```

## :simple-git: If you workflow is a github/gitlab repo or a folder of source

:fontawesome-solid-scroll: __Example inputs__: `https://github.com/juice-shop/juice-shop`, `/tmp/source-code-folder`

:fontawesome-solid-terminal: __Example commands__

```bash

osmedeus scan -m repo-scan -t https://github.com/juice-shop/juice-shop

osmedeus scan -m repo-scan -t /tmp/source-code-folder

osmedeus scan -m repo-scan -T list-of-repos.txt

```