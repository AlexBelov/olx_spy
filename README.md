# README

Set bot token in config

```
telegram:
    bot: bot_token_from_bot_father
```

Use ngrok to get the public url, set it in application.rb

run `rake telegram:bot:set_webhook`

run rails server and sidekiq

use `/link some_url` command in telegram to add a link for monitoring

link can be something like [this](https://www.olx.pl/d/nieruchomosci/mieszkania/wynajem/warszawa/?search%5Bdistrict_id%5D=353&search%5Border%5D=created_at:desc&search%5Bfilter_float_price:to%5D=3000&search%5Bfilter_float_m:from%5D=30&search%5Bfilter_enum_rooms%5D%5B0%5D=one&search%5Bfilter_enum_rooms%5D%5B1%5D=two)
