# :writing_hand_tone1: Customize your own workflow

!!! Warning "All Workflow files are YAML-based so make sure you follow the YAML syntax. Otherwise, it wouldn't work"

After the installation process is finished, your workflow will be stored at `~/osmedeus-base/workflow`.


## 1. Tweaking commands or threads of the tool depends on your machine specification

You can start tweaking the workflow right away by edit any command in module file at `~/osmedeus-base/workflow/general/` folder.

For example you can edit the thread of ffuf command **[here](https://github.com/osmedeus/osmedeus-workflow/blob/main/general/dirbscan.yaml#L42)** on dirbscan module

![tweaking-module](/static/workflow/tweaking-module.png){ loading=lazy }


## 2. Fork another one from community workflow

Fork this repo from here https://github.com/osmedeus/osmedeus-workflow and change anything you want and put it to `~/osmedeus-base/workflow` folder.

## 3. Writing a new flow

Create a new flow file at `~/osmedeus-base/workflow/your-workflow.yaml` and folder `you-workflow` to store your modules file

```yaml
name: your-workflow
desc: run normal routine
type: you-workflow
validator: domain

routines:
  - modules:
      - your-module-here
```