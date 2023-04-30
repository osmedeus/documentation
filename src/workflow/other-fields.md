# :material-file-document: Other Fields

## Type & Flow

Type tag (Only avaliable flow file) is a folder name that will contains module file.

For example if you run the scan `osmedeus scan -f general -t example.com` with module like below. It will look for module file `general/subdomain.yaml` and `general/probing.yaml` to run.

```yaml

name: general
desc: run normal routine
type: general
validator: domain

routines:
  - modules:
      - subdomain
  - modules:
      - probing

  - flow: 'slow' # override the type: general to look for module name slow/portscan.yaml
    modules:
      - portscan
```


## Validator

The validator tag allows you to check the format of the input first before actually running the scan.

```yaml
validator: domain # -t example.com

# or

validator: cidr-file # -t file-of-cidr.txt
```

Here are some built-in formats that available in the Engine

- [x] domain
- [x] url
- [x] ipv4
- [x] cidr

you can also add `-file` after each name to validate input as a file (e.g: `cidr-file`).


## Reports

This field shows a list of files that will show up on the Web UI modules.

Also when call the cleaning script like `Cleaning("{{Output}}/subdomain/")`. It will delete all the things in the subdomain folder except the file in the report section.

When you're using `--resume` flag. This is also the file that the core engine check if the module is already run or not too.


```yaml

name: dirbscan
desc: Run Dirbscan

report:
  final:
    - "{{Output}}/directory/beautify-{{Workspace}}.txt"
    - "{{Output}}/directory/paths-{{Workspace}}.csv"

params:
  - inputFile: "{{Output}}/probing/http-{{Workspace}}.txt"
  - wordlists: "{{Data}}/wordlists/content/small.txt"
```