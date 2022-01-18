
# :material-docker: Using Docker


## Building docker image

If you want to build for the premium package just change the ` https://raw.githubusercontent.com/osmedeus/osmedeus-base/master/install.sh` to the install URL that I gave you.

```shell
git clone --depth=1 git@github.com:osmedeus/osmedeus-base.git
cd osmedeus-base/
docker build -t j3ssie/osmedeus:latest .
```

## Running the scan

<figure markdown> 
  ![crypto-donate](/static/architecture/using-docker.png)
</figure>

```shell
# create a volume with name `osmws` first, if you want to keep workspace data
docker volume create osmws

# run the scan
docker run -it --rm -v osmws:/root/.osmedeus/workspaces j3ssie/osmedeus:latest scan -f fast -t sample.com


# access the docker via bash if you want to see a raw result of the previous or current scan
docker ps

docker exec -it <container-id> /bin/bash

```


## Run the Web UI

Note that `osmedeus-scanner` is just the name, you can use anything you want

```shell
## Start the web server
docker run -d --name osmedeus-scanner -v osmws:/root/.osmedeus/workspaces -p 8000:8000 j3ssie/osmedeus:latest server

## grepping for password
docker exec -it osmedeus-scanner -v osmws:/root/.osmedeus/workspaces grep password /root/.osmedeus/config.yaml | head -1
```