require_relative '../lib/rss.rb'
require_relative '../lib/runner.rb'
require 'pry'

url = 'https://kotaku.com/rss'
default_feeds = ['https://kotaku.com/rss',
  'http://goodbeerhunting.com/sightlines?format=RSS',
  'http://feeds.feedburner.com/RockPaperShotgun']

# my_feed = RSSFeed.new(url)
# binding.pry
# my_feed.list_items
# my_feed.open_item_in_browser(my_feed.items[1])
# get_RSS_feed(url)
runner