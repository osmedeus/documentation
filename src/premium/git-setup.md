# :cloud: Git Setup for Premium Package

!!! info "This feature is quite complex and only available in the premium package. Make sure you understand to tools and its concept of it first"

!!! help ""
    Note that this setup is **Optional**. You can still use the tool perfectly fine without it!

## Setup Storages

Check out **the Private Playlist** on the **#backer** channel in Discord to see a Video Instruction.

### 1. Modify the content of Storages Config file at `~/osmedeus-base/token/osm-var.yaml`


!!! warning "Run these commands below if you not using git before"

    ```shell
    git config --global user.name "your_gitlab_user"
    git config --global user.email "your_gitlab_uid@users.noreply.gitlab.com"
    ```

Please change your username and repository name from `your_gitlab_username` is your gitlab username and `dosm-*` are your Gitlab repo names.

```yaml
storages:
    secret_key: SECRET_KEY
    assets_repo: ASSETS_REPO
    assets_storage: ~/.osmedeus/storages/assets
    http_repo: HTTP_REPO
    http_storage: ~/.osmedeus/storages/http
    mics_repo: MICS_REPO
    mics_storage: ~/.osmedeus/storages/mics
    paths_repo: git@gitlab.com:your_gitlab_username/dosm-paths.git
    paths_storage: ~/.osmedeus/storages/paths
    ports_repo: git@gitlab.com:your_gitlab_username/dosm-ports.git
    ports_storage: ~/.osmedeus/storages/ports
    subdomain_repo: git@gitlab.com:your_gitlab_username/dosm-subdomain.git
    subdomain_storage: ~/.osmedeus/storages/subdomain
    summary_repo: git@gitlab.com:your_gitlab_username/dosm-summary.git
    summary_storage: ~/.osmedeus/storages/summary
    vuln_repo: git@gitlab.com:your_gitlab_username/dosm-vuln.git
    vuln_storage: ~/.osmedeus/storages/vuln
```

Change the `SECRET_KEY` to the path of your secret key that can do the push/pull to your git repo.

### 2. Reload the config to clone repo

```shell
#reload config to cloning the repo

osmedeus config set --threads-hold=10

# then check out your storages folder at `~/.osmedeus/storages/summary`
ls ~/.osmedeus/storages/summary/ 

```
