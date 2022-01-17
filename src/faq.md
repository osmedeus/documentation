# :question: Frequently Asked Questions

???+ question "How to setup the Osmedeus?"
    Please check out **[installation guide here](/installation/)**

???+ success "I love the Osmedeus community. Is there any premium subscription?"
    Please check out the **[premium package here](/premium/)**

???+ question "Is it support Windows?"
    Unfortunately not, it was designed for Linux only. You will need to use Docker or VM if you really want to run Osmedeus on Windows.

???+ info "What are the donation tiers and how much should I donate to be eligible for the premium package?"
    You can join the Patreon here www.patreon.com/j3ssie or here https://docs.osmedeus.org/donation/ to see a private post contains a download link for premium packages. 
    After that you will be invited to backer channel to get direct support then

???+ question "What is the specification required to run Osmedeus?"
    I recommend using VPS since it takes a lot of network bandwidth, the minimum spec would be 1 CPU 2GB RAM. You can of course increase or decrease the threads in the workflow to make it work in any spec

???+ info "Does the X scan run tool Y or not??"
    1. Read the flow and module files to see what a step actually run
    2. Seriously, read the flow and module files.
    3. Remember that you were warned twice about reading the flow and module files.
    4. Just search your tool command no the workflow folder.

???+ question "Where can I find result after the scan done?"
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
    It's simply that there's no vulnerability. It very depends on your Target.


???+ info "How can I update my premium package?"
    You can Join **[Discord Server here](https://discord.gg/gy4SWhpaPU)** to see if anyone can help

???+ question "Why was my scan stuck at portscan?"
    It stay there because it get a sudo password prompt. Some special tools require *root* permission to run like **nmap**. Make sure you allow **nmap** can be run without sudo password prompt.


