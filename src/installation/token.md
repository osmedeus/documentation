
!!! help ""
    Note that this setup is **Optional**. You can still use the tool perfectly fine without it!


There are some places that tokens will store in Osmedeus below

- [x] Amass config files `amass.ini` and `amass-extensive.ini` at  **`~/osmedeus-base/data/configs/`** which is mainly responsible for the subdomain enumeration.

- [x] Main config file **`~/osmedeus-base/token/osm-default.rc`** 


## Amass config 


The **amass.ini** use for the general flow (default) when you run the scan with this command `osmedeus scan -t sample.com`

The **amass-extensive.ini** use for the extentive flow when you run the scan with this command `osmedeus scan -f extentive -t sample.com`

All of your token like Shodan, Censys, SecurityTrails and others should be store there.


## Some other tokens

Other API Keys that require to change to get more information is `GITHUB_TOKEN` at `~/osmedeus-base/token/osm-default.rc`. This token used by `github-subdomains` tools to get more subdomains.

```shell
# Set github token for run github scan
export GITHUB_TOKEN=xxx,xxxx

```

