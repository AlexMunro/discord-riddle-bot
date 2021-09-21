# frozen_string_literal: true

require "discordrb"
require "./riddle_bot/riddle_bank"
require "./riddle_bot/speaker"

bot = Discordrb::Commands::CommandBot.new(
  token: ENV["BOT_TOKEN"],
  client_id: ENV["APP_ID"],
  prefix: "!"
)

riddle_bank = RiddleBot::RiddleBank.new
speaker = RiddleBot::Speaker.new

bot.command :dailyriddle do
  puts "Presenting the daily riddle"
  riddle_bank.daily_riddle.to_message
end

bot.command :riddle do
  puts "Presenting a random riddle"
  riddle_bank.random_riddle.to_message
end

bot.command :wakeup do
  puts "Grab a brush put on a little makeup"
end

bot.command :readriddle do |event|
  channel = event.user.voice_channel
  next "Mate, this only works if you're in a voice channel." unless channel

  bot.voice_connect(channel)
  speaker.read_me(riddle_bank.random_riddle, event.voice)
end

bot.run
