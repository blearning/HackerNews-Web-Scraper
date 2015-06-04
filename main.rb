require 'pry'

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'colorize'

require './application'
require './connect'
require './post'
require './comment'

require './exemptions'


def start_application(url=nil)
  begin raise InvalidURLError, "INVALID URL: Your url is invalid, please paste in a unique url from -> https://news.ycombinator.com/. The url should look something like this \"https://news.ycombinator.com/item?id=9660682\"".red if will_url_work?(url) == false
  end
  application = Application.new
  application.connect(url)
  application.read_details
  #application.read_comments
end

def will_url_work?(url)
  #https://news.ycombinator.com/item?id=9660682
  #if url doesnt start with https://news.ycombinator.com/item?, then return error
  return false unless url.split("?")[0].to_s == 'https://news.ycombinator.com/item'
end

url = ARGV[0]

begin
    raise MissingURLError, "MISSING URL: This is a command-line arguments application. You are missing a URL, please paste in a unique url from -> https://news.ycombinator.com/. The url should look something like this \"https://news.ycombinator.com/item?id=9660682\"".red if url == nil
  end
start_application(url)