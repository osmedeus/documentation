# :material-play: Installation

!!! info "[Follow this link to see a video instruction](https://www.youtube.com/playlist?list=PLiifzv5MjIo3JqKeG5EXbSKDBlqa7v14P)"


## :fontawesome-brands-linux: Install from a base repository

!!! warning ""
    **NOTE** that you need some essential tools like `curl, wget, git, zip, tmux` and login as **root** to start

```shell

bash <(curl -fsSL https://raw.githubusercontent.com/osmedeus/osmedeus-base/master/install.sh)
```

***

## :material-apple: Install for MacOS or ARM based machine

!!! warning ""
    **NOTE** that you need to install **[homebrew](https://brew.sh/)** first.

```shell
bash <(curl -fsSL https://raw.githubusercontent.com/osmedeus/osmedeus-base/master/install-arm.sh)
```

**[Some other changes](/installation/install-note/#when-install-on-macos)** you might need to make if you're really want to use Osmedeus on MacOS

***

## :material-code-tags: Install from source

You will need to configured `Go >= 1.8` environment.

```shell
# Install the base folder first, this will install some third party as well as golang 
bash <(curl -fsSL https://raw.githubusercontent.com/osmedeus/osmedeus-base/master/install-macos.sh)

# clone the source code to your $GOPATH and build the golang project
cd $GOPATH/src/github.com/ && mkdir -p j3ssie
git clone https://github.com/j3ssie/osmedeus
go install

```

## :package: Install from a build release

Make sure you login as **root** otherwise run `sudo su` first then put `build-osm.zip` to any folder (e.g: `/opt/`)

```bash
unzip -q build-osm.zip && cd build-osm
./build.sh

# verify your installation with health command
osmedeus health
```

## [:material-docker: Using Docker](/installation/using-docker/)

Pull the Docker image by running `docker pull j3ssie/osmedeus` and follow [**this page**](/installation/using-docker/) for in depth usage.

***

## :heavy_check_mark: Verify the installation process

Just run the command `osmedeus health`. If you see the content like a image below then it's mean the installation process has been success.

![intro](static/images/osm-health.png){ loading=lazy }

!!! info "The installation process is still success if you see this message. It's just one of many :diamonds: Premium features :diamonds:"

    `[-] Cloud config setup incorrectly. If you install osmedeus on a single machine then it's okay to ignore the cloud setup`

