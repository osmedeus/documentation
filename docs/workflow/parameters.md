# :material-file-document: Parameters

Parameters will be replace when the routine running.

## Default Parameters that built-in the Engine

| Default variable     | Assume you use default config at `~/.osmedeus/config.yaml` |
|:---------------------|:-----------------------------------------------------------|
| `{{.Workspaces}}`    | Workspaces path `~/.osmedeus/workspaces`                   |
| `{{.Storages}}`      | Storages path `~/.osmedeus/storages`                       |
| `{{.Binaries}}`      | Binary path `~/osmedeus-base/binaries`                     |
| `{{.Data}}`          | Data path `~/osmedeus-base/data`                           |
| `{{.Scripts}}`       | Script path `~/osmedeus-base/scripts`                      |
| `{{.BaseFolder}}`    | Base path `~/osmedeus-base`                                |
| `{{.Workflow}}`      | Workflow path `~/osmedeus-base/workflow`                   |
| `{{.Cloud}}`         | Cloud path `~/osmedeus-base/cloud`                         |

***

## Parameters generated from input

| Dynamic variable     | E.g command: `osmedeus scan -t example.com`           |
|:---------------------|:------------------------------------------------------|
| `{{.Target}}`        | `example.com`                                         |
| `{{.Workspace}}`     | just like `{{.Target}}` but strip out `/` char  to `_`. For example `example.com/a/b --> example.com_a_b`|
| `{{.Output}}`        | `{{.Output}} == {{.Workspaces}} + {{.Workspace}}`     |
| `{{.Org}}`           | `example`                                             |
| `{{.custom}}`        | Extra param take from `--params 'custom=anything'`    |
