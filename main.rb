require 'pry'

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'colorize'

require './application'
require './connect'
require './post'
require './comment'


def start_application(url)
  application = Application.new
  application.connect(url)
  application.read_details
  #application.read_comments
end

url = ARGV[0]
start_application(url)

