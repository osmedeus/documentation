
# :material-docker: Using Docker


## Building docker image

!!! question "How to Build docker file for the premium package?"
    Just change the `https://raw.githubusercontent.com/osmedeus/osmedeus-base/master/install.sh` in `Dockerfile` to the install URL that I gave you.


```shell
# build it from the source
git clone --depth=1 http://github.com/osmedeus/osmedeus-base
cd osmedeus-base/
docker build -t j3ssie/osmedeus:latest .

# @NOTE: if you're using Mac Apple Silicon
# run `docker build --platform linux/arm64 --no-cache -t j3ssie/osmedeus:latest-arm .`
```

or pulling the pre-built image from [Docker hub here](https://hub.docker.com/repository/docker/j3ssie/osmedeus/tags).

```shell
docker pull j3ssie/osmedeus:latest
# @NOTE: if you're using Mac Apple Silicon
# run `docker pull j3ssie/osmedeus:latest-arm`
```


## Running the scan

<figure markdown> 
  ![using-docker](/static/architecture/using-docker.png)
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

Please be aware that the term `osmedeus-scanner`` is merely a placeholder, and you are free to choose any name you prefer. Additionally, if you wish to retain your data even after shutting down the Docker, simply attach a volume to it.


```shell
# Create a volumn with the command `docker volume create osmws`
# Add the this string to your command '-v osmws:/root/workspaces-osmedeus' 
# if you want to retain your data

## Start the web server
docker run -d --name osmedeus-scanner \
  -p 8000:8000 j3ssie/osmedeus:latest server

## grepping for the password to logging in the webserver which is `https://localhost:8000/ui/`
docker exec -it osmedeus-scanner \
   grep password /root/.osmedeus/config.yaml | head -1
```

<figure markdown> 
  ![docker-webserver](/static/architecture/using-docker-webserver.png)
</figure>
