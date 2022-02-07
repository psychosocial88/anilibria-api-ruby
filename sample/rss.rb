require 'anilibria/api'
require 'rss'

anilibria = Anilibria::Api::Client.new

today_ts = Date.today.to_time.to_i
raw_rss = anilibria.get_rss(since: today_ts)

feed = RSS::Parser.parse(raw_rss)

puts feed.channel.title
feed.items.each do |item|
  puts "#{item.pubDate.strftime('%H:%M:%S')} | #{item.title}"
end
