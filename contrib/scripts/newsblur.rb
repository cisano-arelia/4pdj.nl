require 'rubygems'
require 'json'
require 'net/http'
require 'yaml'
require 'html2markdown'

$username = "pdj"
puts "Enter Pasword:"
$password = gets.chomp
$userid = "123337"
$howmany = "1000"
$base_url = "http://newsblur.com"
$login_api = "/api/login"
$shares_api = "/social/stories/#{$userid}/#{$username}?limit=#{$howmany}"

# LOGIN
uri = URI.parse($base_url+$login_api)

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.request_uri)
request.body = "username=#{$username}&password=#{$password}"
response = http.request(request)

if (response.code != "200") then
	raise "HTTP #{response.code} : Unable to login"
end

result = JSON.parse(response.body)

if (result["result"] != "ok") then
	raise "Bad login!"
end

cookies = response.response['set-cookie']

# RETRIEVE STORIES
request = Net::HTTP::Get.new(URI.parse($base_url+$shares_api))

request['Cookie'] = cookies

response = http.request(request)

if (response.code != "200") then
	raise "HTTP #{response.code} : Unable to retrieve shares"
end

result = JSON.parse(response.body)

# PROCESS JSON
result["stories"].each{ |story|
	meta = Hash.new

	if (!story["shared_date"].nil?) then meta['date'], *rest = story["shared_date"].split(/ /) end

	if ((!story["story_authors"].nil?) && (!story["story_authors"].empty?)) then
		if (story["story_authors"].kind_of?(Array)) then
			meta['author'] = story["story_authors"].join(', ')
		else
			meta['author'] = story["story_authors"]
		end
	else
		meta['author'] = "?"
	end

	if ((!story["story_tags"].nil?) && (!story["story_tags"].empty?)) then
		meta['tags'] = []
		story["story_tags"].each do |tag|
			meta['tags'].push(tag.gsub(/[^0-9a-z\- ]/i, ''))
		end
	end

	if (!story["shared_comments"].nil?) then meta['comment'] = story["shared_comments"] end

	meta['title'] = story["story_title"]
	meta['source'] = story["story_permalink"]

	filename = meta['date'] + '-' + meta['title']
	filename = filename.downcase.gsub(/[^0-9a-z\-]/i, '_').gsub(/\_+/, "_") + ".html.erb"

	File.open(filename, 'w') {|f| 
		f.write(meta.to_yaml)
		f.write("---\n")
		f.write(story["story_content"].gsub(/(<[^>]+) style=".*?"/i, '\1').gsub(/(<[^>]+) class=".*?"/i, '\1').gsub(/<(\/?)h1>/i,'<\1h2>') + "\n")
	}

	print "Wrote #{filename}\n"
}

