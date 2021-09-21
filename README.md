# discord-riddle-bot
Have friends? Feel the need to alienate them? Give them riddles!

## Supported commands

| Command       | Description                                       |
|---------------|---------------------------------------------------|
| `!riddle`     | Share a mind-bending and/or side-splitting riddle |
| `!dailyriddle`| Share a riddle of temporary significance          |

## How to run
* Ensure you have a Ruby installed (ideally the version mentioned in `.ruby-version`)
* `bundle install`
* If you haven't already, create an application with a bot on the [Discord Developer Portal](https://discord.com/developers)
* Ensure the following environment variables are configured in your shell:

    | Name     | Where to find it                                                                   |
    |----------|------------------------------------------------------------------------------------|
    |APP_ID    | Obtained from the Discord Developer Portal (General Information -> Application ID) |
    |BOT_TOKEN | Obtained from the Discord Developer Portal (Bot -> Token)                          |

* `bundle exec ruby run.rb`
