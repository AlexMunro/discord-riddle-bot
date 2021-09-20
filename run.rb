# frozen_string_literal: true

require "discordrb"
require "./scraper"

bot = Discordrb::Commands::CommandBot.new(
  token: ENV["BOT_TOKEN"],
  client_id: ENV["APP_ID"],
  prefix: "!"
)

bot.command :riddle do
  puts "Presenting the daily riddle"
  Scraper.daily_riddle.to_message
end

bot.command :wakeup do
  puts "Grab a brush put on a little makeup"
end

bot.run
