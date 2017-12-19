require_relative './rss.rb'
require 'pry'

DEFAULT_FEEDS = ['https://kotaku.com/rss',
  'http://goodbeerhunting.com/sightlines?format=RSS',
  'http://feeds.feedburner.com/rockpapershotgun?format=xml']


def runner
  puts 'Welcome to Really Simple RSS'
  puts 'Enter a feed URL or select one of the default feeds (type "list" to see feeds)'
  input = gets.chomp
  list_selection(input)
end

def list_selection(input)
  if input.to_i.to_s == input
    select_feed_from_input(DEFAULT_FEEDS[input.to_i - 1])
  elsif input == 'list'
    list_feeds
  elsif input == 'exit'
    puts 'Goodbye!'
  elsif input.start_with?('http')
    select_feed_from_input(input)
  elsif input == 'help'
    list_help
  end
end

def select_feed_from_input(input)
  new_feed = RSSFeed.new(input)
  new_feed.list_articles
  articles_input(new_feed)
end

def list_feeds
  puts 'Enter the feed number to view articles'
  DEFAULT_FEEDS.each_with_index do |feed, index|
    puts "#{index + 1}. #{feed}"
  end
  list_input
end

# parses input when selecting a feed
def list_input
  puts 'Enter a feed URL or select one of the default feeds (type "list" to see feeds)'
  input = gets.chomp
  list_selection(input)
end

# parses input when viewing a feed's articles
def articles_input(feed)
  puts 'Select an article by number to see more info, or type "help" for more commands'
  input = gets.chomp
  a_num = input.to_i
  if input.to_i.to_s == input
    display_article_info(feed.articles[a_num - 1], a_num)
  elsif input.start_with? 'open' # "open #"
    feed.open_article_in_browser(feed.articles[input.split[-1].to_i - 1])
  elsif input == 'list'
    list_input
  elsif input == 'help'
    items_help
  end
  puts "do things with articles here"
end

def display_article_info(article, num)
  puts "Title: #{article.title}"
  puts "Published Date: #{article.pubDate}"
  puts "Author: #{article.dc_creator}"
  puts "\n"
  puts "Type \"open #{num}\" to open this article in your browser"
end

def list_help
  puts "list command reference goes here"
  list_input
end

def items_help
  puts "articles command reference goes here"
end