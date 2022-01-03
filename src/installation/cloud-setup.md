# Cloud config for distributed scan

!!! info "This is only avalible in premium package"

Currently, Osmedeus only support Digital Ocean and Linode provider. The default cloud config store at `~/osmedeus-base/cloud/config.yaml`.


1. First of all you will need your token store in `~/osmedeus-base/cloud/config.yaml`

#### Digital Ocean

```yaml
clouds:
  - token: "your-api-token"
    provider: "digitalocean"
    name: "do-osmp"
    default_image: "debian-10-x64"
    size: "s-2vcpu-4gb"
    region: "sfo3"

```

#### Linode

```yaml
clouds:
  - token: "your-api-token"
    provider: "linode"
    name: "linode-osmp"
    default_image: "linode/debian10"
    # or can use --size 'g6-standard-1'
    size: "g6-standard-1"
    region: "us-east"
```

##