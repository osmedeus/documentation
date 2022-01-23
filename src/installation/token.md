
!!! help ""
    Note that this setup is **Optional**. You can still use the tool perfectly fine without it!


There are some places that tokens will store in Osmedeus below

### Main token file

By default all main tokens will be store at `~/osmedeus-base/token/osm-default.rc`

There some essential tokens in the token file. 
    - The Github token is needed for github search.
    - All the `TELEGRAM_` is for notification.

```shell
# Set github token for run github scan
export GITHUB_TOKEN=xxx,xxxx

# for telegram
export TELEGRAM_API_TOKEN=1111114500:AAGx
## use this command to get channel ID
## curl 'https://api.telegram.org/bot$TELEGRAM_API_TOKEN/sendMessage?chat_id=@osmpReports&text=hello'
export TELEGRAM_CHANNEL=-100XXXXX
export TELEGRAM_STATUS_CHANNEL=-100XXXXX
export TELEGRAM_REPORT_CHANNEL=-100XXXXX
export TELEGRAM_SENSITIVE_CHANNEL=-100XXXXX
export TELEGRAM_DIRB_CHANNEL=-100XXXXX
export TELEGRAM_MICS_CHANNEL=-100XXXXX

```

After modified the tokens, then run commands below to reload token to the osmedeus config.yaml

```shell
# or edit file osm-default.rc
# add osmedeus-base/token/osm-default.rc to your ~/.bashrc file
echo 'source $HOME/osmedeus-base/token/osm-default.rc' >> ~/.bashrc && source ~/.bashrc

# reload config to osmedeus
osmedeus config reload
```

### Amass config 

By Default Amass config will be store at `~/osmedeus-base/data/configs/amass.ini`


***

## Notification

!!! help ""
    Note that this setup is **Optional**. You can still use the tool perfectly fine without it!

## Notification with Telegram

![intro](../static/noti/telegram-noti-1.png){ loading=lazy }

![intro](../static/noti/telegram-noti-2.png){ loading=lazy }

You can now using **[Notification Scripts](/workflow/noti-scripts/)** in your Workflow

***
