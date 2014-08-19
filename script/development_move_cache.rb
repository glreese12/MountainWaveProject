#!/Users/peterbattaglia/.rvm/rubies/ruby-1.9.2-p0/bin/ruby

require 'net/http'
require 'uri'

# Remove the events.json file from the cache:
`rm /Users/nate/flms/public/events.json`


#seed the cache to ensure the files exist
# TODO: Request the categories.json and get the id's to create the json URLs.
urls = ['http://localhost:3000/events.rss','http://localhost:3000/events.xml','http://localhost:3000/events.js',
         'http://localhost:3000/events.json']

urls.each do |u| 
  url = URI.parse(u)
  req = Net::HTTP::Get.new(url.path)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  } 
end

#rsync the files onto the web server
copy_commands = ['rsync /Users/nate/flms/public/events.rss /Users/nate/Desktop/test',
  'rsync /Users/nate/flms/public/events.xml /Users/nate/Desktop/test/events.xml',
  'rsync /Users/nate/flms/public/events.js /Users/nate/Desktop/test/the_events.js',
  'rsync /Users/nate/flms/public/events.json /Users/nate/Desktop/test/events.json',
  'rsync /Users/nate/flms/public/events/type/*.json /Users/nate/Desktop/test']
  
copy_commands.each do |c|
  `#{c}`
end