# :earth_asia: Default Community workflow

## Anatomy of Public Community methodology

![community-workflow](/static/workflow/community-workflow.png){ loading=lazy }

## List all flow available

```shell
$ osmedeus scan -f [flow-name] -t example.com

            general - run normal routine # default workflow
               cidr - Scan for CIDR File
            domains - run normal routine but without subdomain scan
          extensive - run extensive routine with more in-depth module
               fast - run fast routine
   gently-extensive - run extensive routine but with very low threads
     gently-general - run normal routine but with very low threads
         quick-cidr - Scan for CIDR File but focus on common HTTP Ports
               sync - Sync result based on git
               test - testing workflow
               urls - Scan for List of URLs
      vuln-and-dirb - directly run on vuln scan and directory scan on list of domains
               vuln - run fast routine with vuln scan

```