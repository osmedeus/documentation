# Installation Notes

## When install on MacOS

- Some special tools require *root* permission to run like **nmap**. Make sure you allow **nmap** can be run without **sudo password** prompt.

## When building from source on MacOS 

- You might need to install a cross-complilers to be albe to build linux on mac [**here**](https://github.com/FiloSottile/homebrew-musl-cross)

## How do I build Osmedeus for other architectures like ARM?

You can build the osmedeus binary from source just fine like any other golang projects. But as the [**architecture**](/architecture/) of Osmedeus rely on other third party tools to run the workflow, you have to build those tools from source as well. 

You can easily tweak the [**install-macos.sh**](https://github.com/osmedeus/osmedeus-base/blob/main/install-macos.sh) file to build the tools for your architecture if you understand what are you doing.
