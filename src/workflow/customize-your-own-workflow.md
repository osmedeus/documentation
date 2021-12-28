# :writing_hand_tone1: Customize your own workflow

!!! Warning "All Workflow files are YAML-based. Make sure you follow the YAML syntax otherwise, it would work"

After the installation process is finished, your workflow will be stored at `~/osmedeus-base/workflow`.

You can edit any YAML file with your custom methodology and start using it right away.

## Use your own wordlists

You can start your own wordlists to brute force dns and directory at `~/osmedeus-base/workflow`
Table below is how I like to structure it but you can edit any file if you want.

| Directory Wordlists                         | Description                               |
|:--------------------------------------------|:------------------------------------------|
| `~/osmedeus-base/data/content/small.txt`    | Use for Directory scan of common module  |
| `~/osmedeus-base/data/content/medium.txt`   | Use for Directory scan of medium module  |
| `~/osmedeus-base/data/content/big.txt`      | Use for Directory scan of slow module    |


| Dns Wordlists                               | Description                               |
|:--------------------------------------------|:------------------------------------------|
| `~/osmedeus-base/data/dns/shorts.txt`       | Use for Dns Brute-forcing module  |


## Writing a new flow

