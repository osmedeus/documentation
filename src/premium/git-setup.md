# :cloud: Git Setup for Premium Package

!!! info "This feature is quite complex and only available in the premium package. Make sure you understand to tools and its concept of it first"

!!! help ""
    Note that this setup is **Optional**. You can still use the tool perfectly fine without it!

# Setup Storages

Check out **the Private Playlist** on the **#backer** channel in Discord to see a Video Instruction.

## 1. Modify the `storages:` section in the token file at `~/osmedeus-base/token/osm-var.yaml`

!!! warning "Run these commands below if you not using git before"

    ```shell
    git config --global user.name "your_gitlab_user"
    git config --global user.email "your_gitlab_uid@users.noreply.gitlab.com"
    ```

### The content of storages looks like below

```yaml
storages:
    assets_repo: ASSETS_REPO
    assets_storage: ~/.osmedeus/storages/assets
    http_repo: HTTP_REPO
    http_storage: ~/.osmedeus/storages/http
    mics_repo: MICS_REPO
    mics_storage: ~/.osmedeus/storages/mics
    paths_repo: PATHS_REPO
    paths_storage: ~/.osmedeus/storages/paths
    ports_repo: PORTS_REPO
    ports_storage: ~/.osmedeus/storages/ports
    secret_key: SECRET_KEY
    subdomain_repo: SUBDOMAIN_REPO
    subdomain_storage: ~/.osmedeus/storages/subdomain
    summary_repo: git@gitlab.com:your_gitlab_username/dosm-summary.git
    summary_storage: ~/.osmedeus/storages/summary
    vuln_repo: VULN_REPO
    vuln_storage: ~/.osmedeus/storages/vuln
```

!!! info "Kindly note that you are not required to configure all the repositories and destinations for this. Typically, I only utilize three repositories: `summary_repo, paths_repo, and vuln_repo`"

You'll be required to make adjustments to certain values listed below

- [x] Change the `SECRET_KEY` to the path of your secret key that can do the push/pull to your git repo.
- [x] Change the `your_gitlab_username` to your Gitlab user name
- [x] Change the `SUMMARY_REPO` or `git@gitlab.com:your_gitlab_username/dosm-summary.git` to your Gitlab repo.

!!! example "If you lack the `SECRET_KEY` needed for cloning a Git repository, you can utilize the following command to create the keypair and then place it in the desired location, such as `~/.osmedeus/storages_key`"
    ```bash
    ssh-keygen -t ed25519 -f storages_key -q -N ''
    # then add your key to the gitlab/github account e.g: https://gitlab.com/-/profile/keys
    ```

***

### Understand the storages config pair

The `summary_repo` and `summary_storage` are closely linked, and the same concept applies to the other pairs, such as `vuln_repo` and `vuln_storage`.

- `summary_storage` is a local folder in your instance and in this case it will be `~/.osmedeus/storages/summary`
- `summary_repo` is your gitlab repository and in this case `git@gitlab.com:your_gitlab_username/dosm-summary.git`. This repo will be clone to the your local machine and after you put everything in that folder 

Once you've configured the Git storages, the workflow will manage how data is copied/appended to the local folder and subsequently push the latest changes to your repository.

```yaml
  - scripts:
      # This will copy the the output of probing module to 
      - ExecCmd("cp {{Output}}/probing/dns-{{Workspace}}.txt {{Storages}}/summary/{{Workspace}}/dns-{{Workspace}}.txt")
      # This will do a git push to `git@gitlab.com:your_gitlab_username/dosm-summary.git` repository
      - PushFolder("{{Storages}}/summary/")
```


## 2. Reload the config to clone repo

```shell

# reload config to cloning the repo
osmedeus config check

# then check out your storages folder at `~/.osmedeus/storages/summary`
ls ~/.osmedeus/storages/summary/ 

```
