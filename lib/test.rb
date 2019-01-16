require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'xpath'
   
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   

hachier = {}
i = 0
crypto = page.xpath('//a[@class="link-secondary"]')
price = page.xpath('//a[@class="price"]')

crypto.each do |cryptotext|
    hachier[cryptotext.text] = price[i].text[1..-1]
    i = i + 1
end

print hachier