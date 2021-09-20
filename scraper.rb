# frozen_string_literal: true

require "open-uri"
require "net/http"
require "nokogiri"
require "./riddle"

# Downloads riddles from the source of all riddles
class Scraper
  RIDDLES_URL = "https://www.riddles.com/"

  def self.daily_riddle
    riddle = new(RIDDLES_URL)
    riddle_page = riddle.download_page
    first_riddle(riddle_page)
  end

  def self.first_riddle(riddle_page)
    parse_riddle(riddle_page.css(".panel-body").first)
  end

  def self.parse_riddle(riddle_body)
    Riddle.new(
      riddle_body.css(".orange_dk_span").first.text,
      riddle_body.css(".collapse p").first.text
    )
  end

  def initialize(url)
    @url = url
  end

  def download_page
    uri = URI.parse(@url)
    html = Net::HTTP.get_response(uri).body
    Nokogiri::HTML(html)
  end
end
