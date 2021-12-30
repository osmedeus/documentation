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

Validator tag allows you to check the format of the input first before actually running the scan.

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
