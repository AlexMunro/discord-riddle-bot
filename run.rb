# frozen_string_literal: true

require "discordrb"
require "./riddle_bot/riddle_bank"

bot = Discordrb::Commands::CommandBot.new(
  token: ENV["BOT_TOKEN"],
  client_id: ENV["APP_ID"],
  prefix: "!"
)

riddle_bank = RiddleBot::RiddleBank.new

bot.command :dailyriddle do
  puts "Presenting the daily riddle"
  riddle_bank.daily_riddle
end

bot.command :riddle do
  puts "Presenting a random riddle"
  riddle_bank.random_riddle
end

bot.command :wakeup do
  puts "Grab a brush put on a little makeup"
end

bot.run
