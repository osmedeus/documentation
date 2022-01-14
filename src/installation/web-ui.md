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

## View results in your workspace via static path

By default, the webserver will allow you to view your workspace folder as a static file via the endpoints `/random-prefix-here/workspaces/`.

You can see the detail below.

```shell
cat ~/.osmedeus/config.yaml

server:
  ...
  prefix: random-prefix-here
  ...


curl -k https://your-webserver:8000/random-prefix-here/workspaces/sample.com/subdomain/final-sample.com.txt
```


