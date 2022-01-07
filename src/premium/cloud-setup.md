# :cloud: Cloud config for distributed scan

!!! info "This is only available in the premium package"


![cloud-setup](/static/premium/cloud-setup.png){ loading=lazy }

## 1. Create API Key denpend on your cloud provider

First of all, you will need your token store in `~/osmedeus-base/cloud/provider.yaml` as the format below.

> Currently, Osmedeus only support Digital Ocean and Linode provider.  

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

After changing the api key in `~/osmedeus-base/cloud/provider.yaml`.

***

Changing the **CLOUD_BUILD_REPO** variables at `/root/osmedeus-base/token/cloud-variables.rc` to the URL that you were given to download the premium package.


```shell
source ~/.bashrc

# reload config to osmedeus
osmedeus config reload

# and check if your config is loaded or not
cat /root/.osmedeus/config.yaml

...
cloud:
  build_repo: https://xxx/premium.sh
  cloud_public_key: /root/osmedeus-base/cloud/ssh/cloud
  cloud_secret_key: /root/osmedeus-base/cloud/ssh/cloud.privte
...

```

***

## 2. Create both public and private SSH Key

![cloud-setup](/static/premium/cloud-healthcheck.png){ loading=lazy }

```shell
# This will auto generate the SSH Key if it not found it yet
osmedeus health cloud --debug

```

*** 

<!-- Store these keys to `/root/osmedeus-base/cloud/ssh` and naming them corresponding to your config at `/root/osmedeus-base/token/cloud-variables.rc`. -->

Default SSH Keys should be named like this

```shell
$ ls /root/osmedeus-base/cloud/ssh/cloud
cloud cloud.privte
```

## 3. Create a snapshot with the build command

This will need [packer](https://www.packer.io/downloads) installed on your machine.

```shell
osmedeus provider build --rebuild

# or enable debug mode to see what's going on
osmedeus provider build --rebuild --debug
```

the result of the command should look like this

![cloud-setup](/static/premium/create-snapshot.png){ loading=lazy }

## 4. Now you're ready to start the scan

![cloud-setup](/static/premium/cloud-scan-start.png){ loading=lazy }
