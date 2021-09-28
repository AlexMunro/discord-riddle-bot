# frozen_string_literal: true

require_relative "scraper"

module RiddleBot
  # Access point for commands and avoider of redundant downloads
  class RiddleBank
    def daily_riddle
      return @daily_riddle if @fetched_daily == Time.now.utc.to_date

      @fetched_daily = Time.now.utc.to_date
      @daily_riddle = Scraper.daily_riddle
    end

    def random_riddle
      @riddles ||= Scraper.fetch_five_pages_of_riddles
      @riddles.sample
    end
  end
end
