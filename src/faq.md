# :question: Frequently Asked Questions

???+ question "How to setup the Osmedeus?"
    Please check out **[installation guide here](/installation/)**

???+ success "I love the Osmedeus community. Is there any premium subscription?"
    Please check out the **[premium package here](/premium/)**

???+ question "Is it support Windows?"
    Unfortunately not, it was designed for Linux only. You will need to use Docker or VM if you really want to run Osmedeus on Windows.

???+ info "What are the donation tiers and how much should I donate to be eligible for the premium package?"
    You can join the [**Patreon here**](https://www.patreon.com/j3ssie) or [**here**](https://docs.osmedeus.org/donation/) to see a private post contains a download link for premium packages. 
    After that you will be invited to backer channel to get direct support then

???+ question "What is the specification required to run Osmedeus?"
    I recommend using VPS since it takes a lot of network bandwidth, the minimum spec would be 1 CPU 2GB RAM. You can of course increase or decrease the threads in the workflow to make it work in any spec

???+ info "How can I update my Osmedeus?"
    Just run the install script again and it will be updated. Run `rm -rf /root/osmedeus-base /root/.osmedeus` first if you want to have a fresh install.

???+ info "Does the X scan run tool Y or not?"
    1. Read the flow and module files to see what a step actually run
    2. Seriously, read the flow and module files.
    3. Remember that you were warned twice about reading the flow and module files.
    4. Just search your tool command no the workflow folder.

???+ question "Where can I find the result after the scan done?"
    All of your scan data store at `~/.osmedeus/workspaces/`

???+ info "I got some error while running the scan?"
    ![having-error-with-some-tools](/static/faq/having-error-with-some-tools.png){ loading=lazy }
    You can use `osmedeus health` command to check if the install is okay or not.

    Sometimes error show up mean some of the tools require token to run like `github-subdomains` but you can ignore it since I already catch the error

???+ question "Where I can get a live support?"
    You can Join **[Discord Server here](https://discord.gg/gy4SWhpaPU)** to see if anyone can help

???+ info "I have an awesome idea, How can I implement it in Osmedeus?"
    You can Join **[Discord Server here](https://discord.gg/gy4SWhpaPU)** or contact me via **[:material-twitter: here](https://twitter.com/OsmedeusEngine)** to see if it worth to add.

???+ question "I ran the scan but there's no vulnerability found?"
    It's simply that there's no vulnerability. It very depends on your target.


???+ info "How can I update my premium package?"
    Just run the install script for premium package again and it will be updated.


???+ question "Why was my scan stuck at portscan?"
    It will stay there because it got a sudo password prompt. Some special tools require *root* permission to run like **nmap**. Make sure you allow **nmap** can be run without sudo password prompt.

???+ question "Why was my scan portscan take so long?"
    It's probably because cloud provider / home network limit your portscan or just simply your input is too big. Try to run with `--debug` then you can manually check with the raw command that the portscan module actually running.

???+ info "What is the difference between this flow to other flow?"
    1. Read the flow files to see what difference in them.
    2. Seriously, Read the flow files.
    3. Remember that you were warned twice about reading read the flow files.
    4. Just use diff comparison of each flow file and see what difference field mean [**here**](/workflow/)

???+ question "Where should I put my token (Github, Shodan, etc)?"
    All you need to do is follow [**this guide**](/installation/token/)

???+ info "I found a new tool that pretty awesome. Can you add it in Osmedeus?"
    Yes, just follow this page to added it to your workflow [**this guide**](/workflow/customize-your-own-workflow/).
