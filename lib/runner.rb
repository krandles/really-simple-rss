require_relative './rss.rb'
require 'pry'

DEFAULT_FEEDS = ['https://kotaku.com/rss',
  'http://goodbeerhunting.com/sightlines?format=RSS',
  'http://feeds.feedburner.com/rockpapershotgun?format=xml']


def runner
  puts 'Welcome to Really Simple RSS'
  puts 'Enter a feed URL or select one of the default feeds (type "list" to see feeds)'
  input = gets.chomp
  # text_in = gets.chomp
  # begin
  #   input = Integer(text_in)
  # rescue
  #   input = text_in
  # end
  # binding.pry
  list_selection(input)
end

def list_selection(input)
  if input.to_i.to_s == input
    new_feed = RSSFeed.new(DEFAULT_FEEDS[input.to_i - 1])
    new_feed.list_articles
    items_input(new_feed)
    binding.pry
  elsif input == 'list'
    puts 'Enter the feed number to view articles'
    DEFAULT_FEEDS.each_with_index do |feed, index|
      puts "#{index + 1}. #{feed}"
    end
    list_input
  elsif input == 'exit'
    puts 'Goodbye!'
  elsif input.start_with?('http')
    feed = RSSFeed.new(input)
    feed.list_articles
    items_input(feed)
  elsif input = 'help'
    list_help
    list_input
  end
end

# parses input when selecting a feed
def list_input
  puts 'Enter a feed URL or select one of the default feeds (type "list" to see feeds)'
  input = gets.chomp
  list_selection(input)
end

# parses input when viewing a feed's articles
def items_input(feed)
  puts 'Select an article by number to see more info, or type "help" for more commands'
  input = gets.chomp
  if input.to_i.to_s == input
    feed.open_article_in_browser(feed.articles[input.to_i - 1])
  end
  puts "do things with articles here"
end

def list_help
  puts "command reference goes here"
end