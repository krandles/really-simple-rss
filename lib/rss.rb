require 'rss'
require 'uri'
require 'open-uri'
require 'pry'

url = 'https://kotaku.com/rss'

class RSSFeed
  attr_accessor :url, :title, :articles, :feed

  def initialize(url)
    @url = url
    @feed = get_rss_feed(url)
    @title = feed.channel.title
    @articles = feed.items
  end

  def get_rss_feed(url)
    open(url) { |rss| RSS::Parser.parse(rss, do_validate=false) }
    # TODO: look at validation later
  end

  def list_articles
    puts "\n#{title}\n\n"
    articles.each_with_index do |item, index|
      puts "#{index + 1}. #{item.title}"
    end
    puts "\n"
  end

  def open_article_in_browser(article)
    system "open #{article.link}"
  end

  def create_articles

  end
end

class RSSArticle
  attr_accessor

  def initialize
  
  end


end