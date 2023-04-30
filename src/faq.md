# :question: Frequently Asked Questions

## Premium Package Related Questions 

???+ success "I love the Osmedeus Community version. Is there any premium subscription?"
    Please check out **[the premium package here](/premium/)**

???+ info "What will you get from the Osmedeus Premium Package?"
    You can see what included in the package in **[the premium package page](/premium/)**

???+ question "Does the premium package require a continuous subscription?"
    Currently, it's pay as you go. but I push the update every week, you might miss the latest version of it if you cancel the subscription.

???+ info "Is there any different document for the Premium Package?"
    Nope, it's all **[right here](/premium/)**

???+ question "How do I know I'm using premium package or not?"
    You will see the phrase `💎 Making use of the premium workflow` when runnning the health check command or the `osmedeus workflow` command.

???+ info "Where can I get the private Jaeles signatures and the custom wordlists?"
    **[The premium package page](/premium/)** already included everything from my private Jaeles signatures and the custom wordlists.

???+ info "Where is your **private signatures** and **wordlists** in the premium package?"
    It's all included in the package. The install script will download it all for you. You can also see the details structure [**here**](https://docs.osmedeus.org/premium/#support-distributed-scan).

???+ question "How can I upgrade from Osmedeus Community to Premium Package?"
    Just run `rm -rf ~/osmedeus-base` first then run a install script from the premium package download page.

???+ info "Does Osmedeus Support Windows or ARM based processor (M1 Macbook, Kali Nethunter, etc)?"
    Unfortunately, Osmedeus does not support Windows or ARM based processor. Please consider using WSL, Docker or Virtualization software to able to use Osmedeus on your machine.

???+ info "What are the donation tiers and how much should I donate to be eligible for the premium package?"
    You can join the [**Patreon here**](https://www.patreon.com/j3ssie) or [**here**](https://docs.osmedeus.org/donation/) to see a private post that contains a download link for premium packages. After that you will be invited to the backer channel to get direct support then

???+ info "How can I update my premium package?"
    Just run the install script for the premium package again and it will be updated.

???+ question "Is there any different document for the Premium Package?"
    This is already included everything from my private Jaeles signatures and the custom wordlists.

???+ question "How to Build docker file for a premium package?"
    Just change the `https://raw.githubusercontent.com/osmedeus/osmedeus-base/master/install.sh` in **Dockerfile** to the install URL that I gave you.

## General Questions 

???+ question "How to setup the Osmedeus?"
    Please check out **[installation guide here](/installation/)**

???+ info "How can I determine which workflow to run for my target?
    Please check out **[running your first scan here](/running-your-first-scan/)**

???+ question "I got some error while installing Osmedeus on my machine. How can I fix it?"
    Maybe run `sudo su` first and then run `rm -rf ~/osmedeus-base ~/.osmedeus` and then run the install script again to have a clean installation.

???+ info "I got some `Permission denied` errors while installing Osmedeus on my machine even with `sudo`. How can I fix it?"
    Please run `rm -rf ~/osmedeus-base ~/.osmedeus` to clean up the old installation. Then run `sudo su` first and run the install script again.

???+ question "What is the specification required to run Osmedeus?"
    I recommend using VPS since it takes a lot of network bandwidth, the minimum spec would be 1 CPU 2GB RAM. You can of course increase or decrease the threads in the workflow to make it work in any spec

???+ info "How can I update my Osmedeus?"
    Just run the install script again and it will be updated. Run `rm -rf /root/osmedeus-base /root/.osmedeus` first if you want to have a fresh install.

???+ question "Where can I find the result after the scan done?"
    All of your scan data store at `~/workspaces-osmedeus/`

???+ info "I got some errors while running the scan, what should I do?"
    You can use `osmedeus health` command to check if the install is okay or not.

???+ question "Where I can get a live support?"
    You can Join **[Discord Server here](https://discord.gg/mtQG2FQsYA)** to see if anyone can help

???+ info "I have an awesome idea, How can I implement it in Osmedeus?"
    You can Join **[Discord Server here](https://discord.gg/mtQG2FQsYA)** or contact me via **[:material-twitter: here](https://twitter.com/OsmedeusEngine)** to see if it worth to add.

???+ question "I ran the scan but there's no vulnerability found?"
    It's simply that there's no vulnerability. It very much depends on your target.

???+ question "How can I update the vulnerability database of Jaeles or Nuclei?"
    Just run the command `osmedeus update --vuln`.

???+ question "Why was my scan stuck at portscan?"
    It will stay there because it got a sudo password prompt. Some special tools require *root* permission to run like **nmap**. Make sure you allow **nmap** can be run without sudo password prompt.

???+ question "Why was my scan portscan take so long?"
    It's probably because your cloud provider or your home network limit your portscan or just simply your input is too big. Try to run with `--debug` then you can manually check with the raw command that the portscan module actually running.

???+ info "What is the difference between this flow/module to other flow/module?"
    1. Read the flow/module files to see what difference in them.
    2. Seriously, Read the flow/module files.
    3. Remember that you were warned twice about reading read the flow/module files.
    4. Just use diff comparison of each flow/module file and see what difference field mean [**here**](/workflow/)

???+ question "Where should I put my token (Github, Shodan, etc)?"
    All you need to do is follow [**this guide to setup the token**](/installation/token/)

???+ success "How can I setup to send notification?"
    All you need to do is follow [**this guide to setup notification**](/installation/notification/)

???+ info "I found a new tool that is pretty awesome. Can you add it in Osmedeus?"
    Yes, just follow [**this guide**](/workflow/customize-your-own-workflow/) to add it to your workflow.

???+ question "Why Osmedeus didn't find any vulnerability even when I scan it with the intentionally vulnerable app?"
    Again it very much depends on your target. Osmedeus really shine on large scope targets, not the single intentionally vulnerable web app. Just scan some random VDP then you will see the result.
    The reason it won't find any vulnerability on the intentionally vulnerable app is the **vulnscan** module won't support it. But you're always welcome to customize the workflow to do so.

???+ info "Is it support Proxy?"
    Nope, natively it doesn't support proxy. But since the design of the tool is running other 3rd tools and a lot of them doesn't support proxy by default. I've already consider **proxychains** but it makes it extremely slow and broke a lot of things.

???+ question "I run the cloud scan with `-c 1` why it's only spin up 1 vps?"
    It's only run in 1 vps because you only have 1 target run like `osmedeus cloud -c 2 -f general -t sample.com -t another.com` will run 2 vps.

???+ info "I accidentally terminated the scan. How can I restart or resume it?"
    Just run the command again to start a fresh scan or run the same command with `--resume` flag to resume the scan if any reports file exist.

???+ info "How can I stop the scan? Is there any way to resume it?"
    Yes, just press `Crtl + C` to stop the scan. To resume the scan you can run the same command with additional `--resume` flag but it's depend on `reports:` section in previous module complete or not to actually resume the scan.

???+ question "I stop the scan with `Ctrl+C` in the middle of it. Is it possible to create a summary report?"
    Yes, you can the `osmedeus report` command will check the runtime file in workspace and will show what store in there.

???+ question "How can I delete a workspace?"
    Just delete the workspace folder which is located at `~/workspaces-osmedeus/<target-name-here>` or run the command `osmedeus config delete -w <workspace-name-here>`.

???+ info "Why you use multiple tools for the same purpose in your workflow?"
    I choose some tools over the others because they gave more accurate results. You can always manually test to see the result then decide which one is better. Of course, you are always welcome to customize your workflow to do so.

???+ question "Does the X scan run tool Y or not?"
    1. Read the flow and module files to determine what a step actually runs
    2. Seriously, read the flow and module files.
    3. Remember that you were warned twice about reading the flow and module files.
    4. Search for the tool command in the workflow folder to confirm whether it is used or not (e.g: `rg -F 'jaeles' ~/osmedeus-base/workflow`)

!!! question "What is the `{{Binaries}}` in the workflow?"
    `{{Binaries}}` will be replaced with `~/osmedeus-base/binaries/` where I store all the binaries for running the workflow . If you already install it in your $PATH environment variable then you can just use the tool directly like `your-tool -t {{Target}}` instead of  `{{Binaries}}/your-tool -t {{Target}}`

!!! question "What is the `{{Data}}` in the workflow?"
    `{{Data}}` will be replaced with `~/osmedeus-base/data/` where I store all the config and wordlist for running the workflow. You can always use the absolute path like `/root/osmedeus-base/data/wordlist/your-wordlist.txt` instead of `{{Data}}/wordlist/your-wordlist.txt`

???+ info "I already setup my notification, How do I know it will work?"
    Please run the command here `osmedeus scan -m ~/osmedeus-base/workflow/test/noti.yaml -t sample.com` to test your notification setup. If you received a message in your channel then it works.

???+ question "My test notification is working fine, but I still didn't get any noti on the real scan?"
    It won't show any noti vuln data in your channel simply mean it's not found any vuln. Try to grab some urls with you know is for sure vulnerablie like Jenkins or Jira then run it with urls workflow like this `osmedeus scan -f urls -t list-of-vulnerable-url.txt` and you will see.

???+ question "Why my home router crashed when running Osmedeus?"
    Again, I'm always recommend to run Osmedeus with vps to avoid these issue. If you really want to change the amass config then go to `~/osmedeus-base/data/configs/amass.ini` and edit the `maximum_dns_queries`, and also change some massdns rate on the probing module.

???+ info "Where can I find the password for the Web UI?"
    Please refer to [**this page**]("/installation/web-ui/#start-a-web-server") to start a web server and get credentials. You may need to run this command `cat ~/.osmedeus/config.yaml | grep password`

???+ question "How can I keep the scan or the web UI running in the background?"
    The simplest way to do it is running the process under [tmux session](https://tmuxcheatsheet.com/).

???+ info "How can I run osmedeus in my home network without killing my Internet?"
    It is always recommended to run Osmedeus in VPS, but you can use the `--tactic` or `--threads-hold` slowdown your scan like example command below
    ```
    osmedeus scan --tactic gently -t target.com
    osmedeus scan --threads-hold=30 -f cidr -t 1.2.3.4/24
    ```

???+ question "What should I do if Osmedeus found a vulnerability X?"
    1. Read the vulnerability X description.
    2. Seriously, read the vulnerability X description.
    3. Remember that you were warned twice about reading the vulnerability X description.
    4. Search for that vulnerability X name.
    5. Manually verify the vulnerability X.
    6. Still no results? maybe [**this guide**](https://letmegooglethat.com/?q=what+is+a+vulnerability+X) can help you.

???+ info "Osmedeus found some vulnerable subdomains, but I am unable to access them?"
    It is often the case that the availability of a subdomain found during a scan may not be the same when you attempt to manually verify it. This depends on the target and can vary.
