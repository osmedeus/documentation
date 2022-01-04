# :cloud: Cloud config for distributed scan

!!! info "This is only avalible in premium package"


![cloud-setup](/static/premium/cloud-setup.png){ loading=lazy }

## 1. Create API Key denpend on your cloud provider

First of all, you will need your token store in `~/osmedeus-base/cloud/config.yaml` as the format below.

> Currently, Osmedeus only support Digital Ocean and Linode provider. The default cloud config store at `~/osmedeus-base/cloud/config.yaml`.

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

After changing the api key in `~/osmedeus-base/cloud/config.yaml`.
Changing the **CLOUD_BUILD_REPO** variables at `/root/osmedeus-base/token/cloud-variables.rc` to the URL that you were gave to download the premium package.

***

## 2. Create both public and private SSH Key

```shell
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Store these keys to `/root/osmedeus-base/cloud/ssh` and naming them corresponding to your config at `/root/osmedeus-base/token/cloud-variables.rc`.

Default one should be name as 

```
/root/osmedeus-base/cloud/ssh/cloud.pub
/root/osmedeus-base/cloud/ssh/cloud.privte
```

## 3. Create a snapshot with build command

This will need [packer](https://www.packer.io/downloads) installed on your machine.

```shell
osmedeus provider build --rebuild

# or enable debug mode to see what's going on
osmedeus provider build --rebuild --debug
```

the result of the command will looks like this

![cloud-setup](/static/premium/create-snapshot.png){ loading=lazy }

## 4. Now you're ready to go with the config

![cloud-setup](/static/premium/cloud-scan-start.png){ loading=lazy }
