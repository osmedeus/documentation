# :material-web: Web UI (Experimental)

## Start a web server

Open a new terminal or tmux and run

```shell
osmedeus server
```

The server will be avaliable at **HTTPS** URL here: `https://your-vps-ip:8000/ui/`

![login](/static/architecture/ui-login.png){ loading=lazy }



Then get the credentials from this file.

```shell
cat ~/.osmedeus/config.yaml

...
client:
  password: xxxx
  username: osmedeus
...

```
![home](/static/architecture/ui-home.png){ loading=lazy }

![workspace](/static/architecture/ui-workspace.png){ loading=lazy }
