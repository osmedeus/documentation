# :mag: Running Your First Scan

**:information_source:  Some tips before you start the scan**
!!! tips "You can slowdown or speedup the scan by provide a `--tactic` or `--threads-hole` command line flag?"
    By default the threads hold for the workflow will equals of your number of CPUs, but you can change it by using `--threads-hold=20`. You can also use  `--tactic=gently` flag to slowdown or the `--tactic=aggressive` speedup the scan.

    for example: `osmedeus scan --threads-hold=10 -t example.com`

!!! example "Running the command `osmedeus workflow ls` to show full workflow, `osmedeus workflow view -f general` to show the detailed about the workflow and `osmedeus scan -hh` to see the full help of the scan command"

!!! danger "To avoid encountering errors, it is important to ensure that the scan is executed using the correct input format."

***

## :fontawesome-solid-wand-magic-sparkles: Please review the input example and select the workflow that best suits it in order to achieve optimal scanning results

## :octicons-globe-24: a domain or a list of subdomains

:fontawesome-solid-scroll: __Example inputs__: `example.com` , `target.co.uk`

!!! example "If your input is `sub.example.com` and you are aware that there are **NOT** many subdomains associated with it (such as `another.sub.example.com`), then it may not approriate to run the `general` workflow."


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

!!! danger "The workflows listed below solely permit input in the form of a file. If your input is not in the file format, kindly arrange it in a file prior to execution."

:fontawesome-solid-terminal: __Example commands__

```bash
osmedeus scan -f urls -t list-of-urls.txt

# This will automatically convert the input into a file named http-sub.example.com.txt
osmedeus scan -f urls -t https://sub.example.com/

osmedeus scan -f domains -t list-of-domains.txt

# using with module
osmedeus scan -m http-probing -t list-of-domains.txt

osmedeus scan -m vuln-scan -t list-of-domains.txt

osmedeus scan -m content-discovery -t list-of-domains.txt
osmedeus scan -m content-discovery -t list-of-urls.txt
```

## :material-ip: CIDR or a list of CIDRs

:fontawesome-solid-scroll: __Example inputs__: Your input is **a file** that includes a catalog of IP addresses, CIDR such as `1.2.3.4/24` , `3.4.5.6`, etc or a simple CIDR like `1.2.3.4/24`

:fontawesome-solid-terminal: __Example commands__

```bash
osmedeus scan -f cidr -t list-of-cidr.txt

# This will automatically convert the input into a file named 1.2.3.4/24_random.txt
osmedeus scan -f cidr -t 1.2.3.4/24


osmedeus scan -f cidr-probing -t 3.4.5.6/24

```

## :simple-git: a URL, a GitHub/GitLab repository, or a directory containing source files

:fontawesome-solid-scroll: __Example inputs__: `https://github.com/juice-shop/juice-shop` (only apply for GitHub or GitLab link), `/tmp/source-code-folder`

:fontawesome-solid-terminal: __Example commands__

```bash
osmedeus scan -m repo-scan -t https://github.com/juice-shop/juice-shop

osmedeus scan -m repo-scan -t /tmp/source-code-folder

osmedeus scan -m repo-scan -T list-of-repos.txt

```

## :material-details: View of all toggleable and skippable parameters in the workflow.

![osmedeus-workflow-view](/static/images/osmedeus-workflow-view.png){ loading=lazy }
