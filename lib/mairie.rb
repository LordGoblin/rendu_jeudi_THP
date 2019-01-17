require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'xpath'

def get_townhall_email(townhall_url)
	page = Nokogiri::HTML(open(townhall_url))
	email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text

	if email.size < 1
		email = "nill"
	end
	return email
end

def get_townhall_urls
	i = 0
	page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
	array_ville = []
	array_mail = []
	hachier = {}
	array = []
	ville = page.xpath('//a[@class="lientxt"]')

	ville.each do |a|
      	array_ville[i] = a['href'][1..-1]
      	array_mail = get_townhall_email("http://annuaire-des-mairies.com#{array_ville[i].downcase}")
      	hachier = {}
      	hachier[a.text] = array_mail
      	array[i] = hachier
      	i = i + 1
      	puts hachier
    end
    return array
end

#print get_townhall_urls