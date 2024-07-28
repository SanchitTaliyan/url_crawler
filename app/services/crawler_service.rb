require 'nokogiri'
require 'httparty'

class CrawlerService
  def initialize(url)
    @url = url
  end

  def fetch_metadata
    response = HTTParty.get(@url)
    parsed_content = Nokogiri::HTML(response.body)

    title = parsed_content.at_css('title')&.text
    description = parsed_content.at_css('meta[name="description"]')&.attr('content')
    keywords = parsed_content.at_css('meta[name="keywords"]')&.attr('content')
    author = parsed_content.at_css('meta[name="author"]')&.attr('content')
    viewport = parsed_content.at_css('meta[name="viewport"]')&.attr('content')
    robots = parsed_content.at_css('meta[name="robots"]')&.attr('content')
    body = parsed_content.at_css('body')&.text

    {
      url: @url,
      title: title,
      description: description,
      keywords: keywords,
      author: author,
      viewport: viewport,
      robots: robots,
      body: body
    }
  end

  def classify_content(body)
    # A simple word frequency classifier
    words = body.split(/\W+/)
    frequency = words.each_with_object(Hash.new(0)) { |word, hash| hash[word.downcase] += 1 }
    frequency.sort_by { |_, count| -count }.first(10).to_h
  end
end
