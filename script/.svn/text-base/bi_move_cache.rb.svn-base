# This is a temporary work around to seeding the cache and pushing the content to the corporate web servers.

#!/usr/bin/ruby

require 'net/http'
require 'uri'

# Remove the events.json file from the cache:
`rm /dg/local/firstLookMessaging/current/public/events.json`
`rm /dg/local/firstLookMessaging/current/public/events.rss`
`rm /dg/local/firstLookMessaging/current/public/events.xml`
`rm /dg/local/firstLookMessaging/current/public/events.js`
`rm /dg/local/firstLookMessaging/current/public/events/type/*.json`

#seed the cache to ensure the files exist
urls = ['http://tu00gcsapp001:8081/events.json','http://tu00gcsapp001:8081/events.rss','http://tu00gcsapp001:8081/events.xml','http://tu00gcsapp001:8081/events.js',
  'http://tu00gcsapp001:8081/events/type/3.json','http://tu00gcsapp001:8081/events/type/4.json','http://tu00gcsapp001:8081/events/type/5.json',
  'http://tu00gcsapp001:8081/events/type/6.json']

urls.each do |u| 
  url = URI.parse(u)
  req = Net::HTTP::Get.new(url.path)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  } 
end

#rsync the files onto the web server
copy_commands = ['rsync /dg/local/firstLookMessaging/current/public/events.rss /dg/local/firstLookMessaging/shared/cache_copy',
  'rsync /dg/local/firstLookMessaging/current/public/events.json /dg/local/firstLookMessaging/shared/cache_copy',
  'rsync /dg/local/firstLookMessaging/current/public/events.xml /dg/local/firstLookMessaging/shared/cache_copy/events.xml',
  'rsync /dg/local/firstLookMessaging/current/public/events.js /dg/local/firstLookMessaging/shared/cache_copy/the_events.js',
  'rsync /dg/local/firstLookMessaging/current/public/events/type/*.json /dg/local/firstLookMessaging/shared/cache_copy/']
  
copy_commands.each do |c|
  `#{c}`
end