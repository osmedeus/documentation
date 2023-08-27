
!!! help ""
    Note that this setup is **Optional**. You can still use the tool perfectly fine without it!


There are some places that tokens will store in Osmedeus below

- [x] Amass config files `~/osmedeus-base/data/amass-config/datasources.yaml` at  **`~/osmedeus-base/data/configs/`** which is mainly responsible for the subdomain enumeration.

- [x] Main config file **`~/osmedeus-base/token/osm-default.rc`** 


## Amass config 

All your tokens, such as Shodan, Censys, SecurityTrails, and others are store in `~/osmedeus-base/data/amass-config/datasources.yaml`. 
You can begin making modifications to the configuration there to utilize third-party services while using Osmedeus.

## Some other tokens

Other API Keys that require to change to get more information is `GITHUB_TOKEN` at `~/osmedeus-base/token/osm-default.rc`. This token used by `github-subdomains` tools to get more subdomains.

```shell
# Set github token for run github scan
export GITHUB_TOKEN=xxx,xxxx

```

