
!!! help ""
    Note that this setup is **Optional**. You can still use the tool perfectly fine without it!


!!! warning ""
    You should only store your token in the `osm-default.rc` file. Modify the `~/.osmedeus/config.yaml` will work but you will lose your token when the next time you run the reload command.

# Notification with Telegram


## 1. Create a Telegram Bot

<figure markdown> 
    ![create-bot](/static/noti/create-a-bot.png)
    Follow [**this guide**](https://core.telegram.org/bots/faq#how-do-i-create-a-bot) to generate your API token
</figure>


## 2. Create a Telegram Channel

<figure markdown> 
    ![create-bot](/static/noti/create-a-channel.png)
    Create a channel and add your bot to it. Keep it **Public** until you get the channel ID.
</figure>


## 3. Get your channel ID

<figure markdown> 
  ![create-bot](/static/noti/send-sample-text-to-get-channel-ID.png)
</figure>

run the command below to get your channel ID (make sure you replace the `<your-token>` and `<your-bot-URL-at-step-1>` with your own):


```bash
curl 'https://api.telegram.org/bot5321597600:<your-token>/sendMessage?chat_id=@<your-bot-URL-at-step-1>&text=hello'
```

the output will look like this

```json
{"ok":true,"result":{"message_id":2,"sender_chat":{"id":-1001353928111,"title":"your-osm-channel","username":"yourOsmChannel","type":"channel"},"chat":{"id":-1001353928111,"title":"your-osm-channel","username":"yourOsmChannel","type":"channel"},"date":1650958729,"text":"hello"}}
```
grab your channel ID from the `id` field. In this case, it should be `-1001353928111`.



## 4. Put your bot API key and channel ID in the `osm-default.rc` file

Now add the API Key and channel ID to the `~/osmedeus-base/token/osm-default.rc` file.

```shell
# for telegram
export TELEGRAM_API_TOKEN=1111111100:AAGx
## run this command to get channel ID: curl 'https://api.telegram.org/bot$TELEGRAM_API_TOKEN/sendMessage?chat_id=@osmpReports&text=hello'
## {"ok":true,"result":{"message_id":2,"sender_chat":{"id":-1001353928111,"title":"your-osm-channel","username":"yourOsmChannel","type":"channel"},"chat":{"id":-1001353928111,"title":"your-osm-channel","username":"yourOsmChannel","type":"channel"},"date":1650958729,"text":"hello"}}
## --> your channel ID is '-1001353928111'

export TELEGRAM_CHANNEL=-100XXXXX
export TELEGRAM_STATUS_CHANNEL=-100XXXXX
export TELEGRAM_REPORT_CHANNEL=-100XXXXX
export TELEGRAM_SENSITIVE_CHANNEL=-100XXXXX
export TELEGRAM_DIRB_CHANNEL=-100XXXXX
export TELEGRAM_MICS_CHANNEL=-100XXXXX
```

You may also noticed that there are some telegram channels in the `osm-default.rc` file. You can set all of them to the same channel ID for simplicity. 

But if you want to have more visibility, repeat steps 2 and 3 above to have more channel ID and add it to the `osm-default.rc` file.

## 5. Reload the config and check if everything is working

After modified the tokens, then run commands below to reload token to the osmedeus config.yaml

```shell
# or edit file osm-default.rc
# add osmedeus-base/token/osm-default.rc to your ~/.bashrc file
echo 'source $HOME/osmedeus-base/token/osm-default.rc' >> ~/.bashrc && source ~/.bashrc

# reload config to osmedeus
osmedeus config reload

# check if config is loaded to osmedeus config yet or not
cat ~/.osmedeus/config.yaml | grep 'telegram_'
  telegram_channel: "-100XXXXX"
  telegram_dirb_channel: "-100XXXXX" # this should show your channel ID
  telegram_mics_channel: "-100XXXXX" 
  telegram_report_channel: "-100XXXXX"
  telegram_sensitive_channel: "-100XXXXX"
  telegram_status_channel: "-100XXXXX"
```


## 6. Run the test workflow to see everything is working fine

```shell
osmedeus scan -m ~/osmedeus-base/workflow/test/noti.yaml -t sample.com
```

Check your telegram channel to see any message is sent.


## 7. See what noti scripts use in the workflow.

!!! success "By default the notification script already setup in the workflow, you will automatically see the notification when the scan is done."

You can also search `TeleMessByFile` script in the workflow which will send the message as the content of a file to a specific channel.

<figure markdown> 
  ![Usage](/static/noti/telegram-noti-1.png)
   <br/>
  ![Usage](/static/noti/telegram-noti-2.png)
  Here is how the real results looks like.
</figure>

You can see more usage of **[notification scripts here](/workflow/noti-scripts/)** 


```yaml

# Content of the file `~/osmedeus-base/token/osm-default.rc` is represent for specific channel name as below
export TELEGRAM_CHANNEL=-100XXXXX           --> #general
export TELEGRAM_STATUS_CHANNEL=-100XXXXX    --> #status
export TELEGRAM_REPORT_CHANNEL=-100XXXXX    --> #report
export TELEGRAM_SENSITIVE_CHANNEL=-100XXXXX --> #sensitive
export TELEGRAM_DIRB_CHANNEL=-100XXXXX      --> #dirb
export TELEGRAM_MICS_CHANNEL=-100XXXXX      --> #mics

# this will send the file '{{Output}}/vuln/sensitive/sensitivescan-{{Workspace}}-{{TS}}.txt' to the channel TELEGRAM_SENSITIVE_CHANNEL above
- TeleMessByFile("#sensitive", "{{Output}}/vuln/sensitive/sensitivescan-{{Workspace}}-{{TS}}.txt")


# this will send the file 'Start the scan {{Target}}' to the channel TELEGRAM_MICS_CHANNEL above 
- TeleMess("#mics", "Start the scan {{Target}}")

```
