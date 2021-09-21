# frozen_string_literal: true

require "open-uri"
require "net/http"
require "nokogiri"
require_relative "riddle"
require "byebug"

module RiddleBot
  # Downloads riddles from the source of all riddles
  module Scraper
    DAILY_RIDDLE_URL = "https://www.riddles.com"
    MANY_RIDDLES_URL = "https://www.riddles.com/riddles?sort=new"

    def self.fetch_page_of_riddles
      puts "Fetching an entire page of riddles."
      puts "Be considerate and don't do this too often!"

      download_page(MANY_RIDDLES_URL)
        .css(".panel-body")
        .to_a
        .filter { |node| node.text.include?("Riddle:") }
        .map { |node| parse_riddle(node) }
        .compact
    end

    def self.daily_riddle
      puts "Fetching the daily riddle."
      puts "Be considerate and don't do this too often!"

      riddle_element = download_page(DAILY_RIDDLE_URL)
        .css(".panel-body")
        .first

      parse_riddle(riddle_element)
    end

    private_class_method def self.download_page(url)
      uri = URI.parse(url)
      html = Net::HTTP.get_response(uri).body
      Nokogiri::HTML(html)
    end

    private_class_method def self.parse_riddle(riddle_element)
      return unless (question = riddle_element.css(".orange_dk_span").first)
      return unless (answer = riddle_element.css(".collapse p").first)

      Riddle.new(question.text, answer.text)
    end
  end
end
