# This is a temporary work around to seeding the cache and pushing the content to the corporate web servers.

#!/usr/bin/ruby

require 'net/http'
require 'uri'

# Remove files from the cache that depend on changes in the DB (or external WFS servers)
# and thus will not auto-expire cache:
#`rm /dg/local/firstLookMessaging/current/public/events.json`
`rm /dg/local/firstLookMessaging/current/public/events.xml`
`rm /dg/local/firstLookMessaging/current/public/events.rss`
`rm /dg/local/firstLookMessaging/current/public/events.js`
`rm /dg/local/firstLookMessaging/current/public/events/type/*.json`

#seed the cache to ensure the files exist
urls = ['http://pu00gcsapp004:8080/events.rss','http://pu00gcsapp004:8080/events.xml','http://pu00gcsapp004:8080/events.js',
  'http://pu00gcsapp004:8080/events/type/3.json','http://pu00gcsapp004:8080/events/type/4.json','http://pu00gcsapp004:8080/events/type/5.json',
  'http://pu00gcsapp004:8080/events/type/6.json','http://pu00gcsapp005:8080/events.json','http://pu00gcsapp005:8080/events.rss','http://pu00gcsapp005:8080/events.xml','http://pu00gcsapp005:8080/events.js',
    'http://pu00gcsapp005:8080/events/type/3.json','http://pu00gcsapp005:8080/events/type/4.json','http://pu00gcsapp005:8080/events/type/5.json',
    'http://pu00gcsapp005:8080/events/type/6.json']

urls.each do |u| 
  url = URI.parse(u)
  req = Net::HTTP::Get.new(url.path)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  } 
end

#rsync the files onto the web server
copy_commands = ['rsync /dg/local/firstLookMessaging/current/public/events.rss fldata@pu00infweb001:/www/html/firstlookrss',
  'rsync /dg/local/firstLookMessaging/current/public/events.xml fldata@pu00infweb001:/www/html/content/firstlook/events.xml',
  'rsync /dg/local/firstLookMessaging/current/public/events.js fldata@pu00infweb001:/www/html/content/firstlook/js/mylibs/the_events.js',
  'rsync /dg/local/firstLookMessaging/current/public/events/type/*.json fldata@pu00infweb001:/www/html/content/firstlook/cache/events/type/']
  
copy_commands.each do |c|
  `#{c}`
end