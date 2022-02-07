# :cloud: Cloud config for distributed scan

!!! info "This is only available in the premium package"

## Here is how the scan looks like

![cloud-start-scan](/static/premium/cloud-scan-start.png){ loading=lazy }


## Setup with the wizard

Just run `osmedeus provider wizard` then fill your API keys, press enter to use default value.


![cloud-wizard](/static/premium/provider-wizard.png){ loading=lazy }

You can also do some other actions to your provider with `osmedeus provider` command

![cloud-utils](/static/premium/provider-utils.png){ loading=lazy }

***

## Manual Setup

### 1. Create API Key denpend on your cloud provider

First of all, you will need your token store in `~/osmedeus-base/cloud/provider.yaml` as the format below.

> Currently, Osmedeus only support Digital Ocean and Linode provider.  

![cloud-setup](/static/premium/cloud-manual-setup.png){ loading=lazy }


### 2. Create both public and private SSH Key


```shell
# This will auto generate the SSH Key if it not found it yet
osmedeus health cloud --debug

```

### 3. Create a snapshot with the build command

This will need [**packer v1.7.8**](https://www.packer.io/downloads) installed on your machine.

```shell
osmedeus provider build --rebuild

# or enable debug mode to see what's going on
osmedeus provider build --rebuild --debug
```

the result of the command should look like this

![cloud-setup](/static/premium/create-snapshot.png){ loading=lazy }

***

If you have any error make sure to check the content of these first

- [x] your api key is in `~/osmedeus-base/cloud/provider.yaml`.
- [x] run `osmedeus config reload` to make sure everything loaded.
- [x] `ls /root/osmedeus-base/cloud/ssh/cloud` have two SSH Keys.
- [x] [packer v1.7.8](https://www.packer.io/downloads) is ready on your host machine.
