require 'net/http'
require 'uri'

class Phrzsr
  VALID_CATEGORIES = [:motivational, :demotivational, :gratitude, :greetings, :farewells]

  def self.phrzsr(category_or_url = :motivational, args = [])
    if category_or_url =~ /^#{URI::regexp}$/
      url = category_or_url
    else
      raise CategoryError unless VALID_CATEGORIES.include?(category_or_url.to_sym)
      category = category_or_url.to_sym
      url = github_url(category)
    end
    phrase_from_url(url)
  end

  private

  def self.phrase_from_url(url)
    text = Net::HTTP.get(URI.parse(url))
    possible_phrases = text.split("\n")
    possible_phrases.sample
  end

  def self.github_url(category)
    "https://raw.github.com/Phrzsr/phrzsr/master/#{category.to_s}"
  end

end

class CategoryError < StandardError; end