
!!! help ""
    Note that this setup is **Optional**. You can still use the tool perfectly fine without it!


There are some places that tokens will store in Osmedeus below

- [x] Amass config files `~/osmedeus-base/data/amass-config/datasources.yaml` at  **`~/osmedeus-base/data/configs/`** which is mainly responsible for the subdomain enumeration.

- [x] Main tokens file **`~/osmedeus-base/token/osm-var.yaml`** 


## Amass config 

All your tokens, such as Shodan, Censys, SecurityTrails, and others are store in `~/osmedeus-base/data/amass-config/datasources.yaml`. 
You can begin making modifications to the configuration there to utilize third-party services while using Osmedeus.

## Any other tokens

Any other config that require to change to get more is store `~/osmedeus-base/token/osm-var.yaml`.

The primary section for storing your API keys can be found in the `token:` section, as shown below. When you run the Osmedeus scan, it will automatically load these keys into your operating system environment

```yaml
tokens:
    GITHUB_TOKEN: GITHUB_TOKEN
    GITLAB_API_TOKEN: GITLAB_API_TOKEN
    SLACK_API_TOKEN: SLACK_API_TOKEN
    TELEGRAM_API_TOKEN: TELEGRAM_API_TOKEN
```

For example `GITHUB_TOKEN` used by github-subdomains tools to get more subdomains.