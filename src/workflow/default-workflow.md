# Default Community workflow

## Anatomy of Public Community methodology

![intro](/static/workflow/community-workflow.png){ loading=lazy }

## List all flow avaliable

```shell
$ osmedeus scan -f [flow-name] -t example.com

   general - run normal routine # default workflow
      cidr - Scan for CIDR File
   domains - run normal routine but without subdomain scan
      fast - run fast routine
      slow - run slow routine
      sync - Sync result based on git
      test - testing workflow
      urls - Scan for List of URLs
      vuln - run fast routine with vuln scan
```