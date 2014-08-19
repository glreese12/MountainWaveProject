# This is a temporary work around to seeding the cache and pushing the content to the corporate web servers.

#!/usr/bin/ruby

require 'net/http'
require 'uri'

# Remove the events.json file from the cache:
`rm /dg/local/firstLookMessaging/current/public/events.json`

#seed the cache to ensure the files exist
urls = ['http://pu00gcsapp004:8080/events.json']

urls.each do |u| 
  url = URI.parse(u)
  req = Net::HTTP::Get.new(url.path)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  } 
end

#rsync the files onto the web server
copy_commands = ['rsync /dg/local/firstLookMessaging/current/public/events.json fldata@pu00infweb001:/www/html/content/firstlook/events.json']
  
copy_commands.each do |c|
  `#{c}`
end