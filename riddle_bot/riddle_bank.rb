# frozen_string_literal: true

require_relative "scraper"

module RiddleBot
  # Access point for commands and avoider of redundant downloads
  class RiddleBank
    def daily_riddle
      riddles[0]
    end

    def random_riddle
      riddles.sample
    end

    private

    def riddles
      @riddles ||= Scraper.fetch_page_of_riddles
    end

    def fetch_daily_riddle
      return @daily_riddle if @fetched_daily == Date.today

      @fetched_daily = Date.today
      @daily_riddle = Scraper.daily_riddle
    end
  end
end
