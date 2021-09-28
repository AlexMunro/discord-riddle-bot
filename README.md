# discord-riddle-bot
Have friends? Feel the need to alienate them? Give them riddles!

## Supported commands

| Command       | Description                                       |
|---------------|---------------------------------------------------|
| `!riddle`     | Share a mind-bending and/or side-splitting riddle |
| `!dailyriddle`| Share a riddle of temporary significance          |
| `!readriddle` | Share a riddle by the antipodean medium of audio  |

## How to run
* Ensure you have a Ruby installed (ideally the version mentioned in `.ruby-version`)
* `bundle install`
* [OPTIONAL: needed for voice commands] Ensure you have libsodium, libopus and FFmpeg installed on your system.
* If you haven't already, create an application with a bot on the [Discord Developer Portal](https://discord.com/developers)
* Create a Service Account for Google Cloud Platform's Text-to-Speech API and download credentials for it in a keyfile.
* Ensure the following environment variables are configured in your shell:

    | Name                          | Where to find it                                                                             |
    |-------------------------------|----------------------------------------------------------------------------------------------|
    |APP_ID                         | Obtained from the Discord Developer Portal (General Information -> Application ID)           |
    |BOT_TOKEN                      | Obtained from the Discord Developer Portal (Bot -> Token)                                    |
    |GOOGLE_APPLICATION_CREDENTIALS | Location of a Google Cloud Platform Text-to-Speech keyfile (only required for voice commands)|

* `bundle exec ruby run.rb`
