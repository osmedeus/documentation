# :cloud: Git Setup for Premium Package

!!! info "This feature is quite complex and only available in the premium package. Make sure you understand to tools and its concept of it first"

!!! help ""
    Note that this setup is **Optional**. You can still use the tool perfectly fine without it!

## Setup Storages

Check out **the Private Playlist** on the **#backer** channel in Discord to see a Video Instruction.

### 1. Modify the content of Storages Config file at `~/osmedeus-base/token/storages-alias.rc`

Please change your username and repository name from `your_gitlab_username` is your gitlab username and `dosm-*` are your Gitlab repo names.


```shell
export ENABLE_GIT_STORAGES=TRUE
export GIT_SSH_COMMAND='ssh -o StrictHostKeyChecking=no -i ~/.osmedeus/storages_key'

# for storages
export SECRET_KEY=~/.osmedeus/storages_key

# core one
export SUMMARY_REPO=git@gitlab.com:your_gitlab_username/dosm-summary
export VULN_REPO=git@gitlab.com:your_gitlab_username/dosm-vuln
export PATHS_REPO=git@gitlab.com:your_gitlab_username/dosm-paths
export HTTP_REPO=git@gitlab.com:your_gitlab_username/dosm-http

# mics one
export ASSETS_REPO=git@gitlab.com:your_gitlab_username/dosm-assets
export PORTS_REPO=git@gitlab.com:your_gitlab_username/dosm-ports
export MICS_REPO=git@gitlab.com:your_gitlab_username/dosm-cloud
export SUBDOMAIN_REPO=git@gitlab.com:your_gitlab_username/dosm-subdomain
```


### 2. Load the storages variables to Osmedeus config

!!! warning "Run these commands below if you not using git before"

    ```shell
    git config --global user.name "your_gitlab_user"
    git config --global user.email "your_gitlab_uid@users.noreply.gitlab.com"
    ```

```shell
echo 'source $HOME/osmedeus-base/token/storages-alias.rc' >> ~/.bashrc && source ~/.bashrc

# reload config to osmedeus
osmedeus config reload
```

This will generate the public key at `/root/.osmedeus/storages_key.pub`. Please add this public key at to your gitlab profile.

You can also check if the config was loaded or not 

```shell
cat ~/.osmedeus/config.yaml  | grep 'secret_key'
```

### 3. Reload the config to clone repo

```shell
#reload config to cloning the repo

osmedeus config reload --debug

# then check out your storages folder at `~/.osmedeus/storages/summary`
ls ~/.osmedeus/storages/summary/ 

```
