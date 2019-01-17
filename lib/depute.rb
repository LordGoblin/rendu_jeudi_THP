require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'xpath'

def get_email(townhall_url)
	page = Nokogiri::HTML(open(townhall_url))
	email = page.xpath('//a[contains(@href,"mailto")]').text
	#email = email[0..(email.count"fr")]

	#if email.size < 1
	#	email = "nill"
	#end
	return email
end

def get_prenom_urls
	i = 0
	b = 0
	page = Nokogiri::HTML(open('https://www.nosdeputes.fr/deputes'))
	array_prenom = []
	array_nom =[]
	array_mail = []
	hachier = {}
	array = []
	profile = page.xpath('//a')
	#puts profile.xpath('//div//span')

	#puts profile

	profile.each do |a|
		array_nom = a['href'][1..-1]
		if array_nom[0..-3] == "deputes" || array_nom.size < 1 || array_nom.include?("ttps") == true || array_nom.include?("faq") == true || array_nom.include?("dossiers") == true || array_nom.include?("groupe") == true || i < 23
			array_nom.clear
		else

			array_mail = get_email("https://www.nosdeputes.fr/#{array_nom}")
			puts array_mail
			b = b + 1
		end
		
		i = i + 1
	end
	puts b
	#puts profile

	#ville.each do |a|
     # 	array_ville[i] = a['href'][1..-1]
     # 	array_mail = get_townhall_email("http://annuaire-des-mairies.com#{array_ville[i].downcase}")
      #	hachier = {}
     # 	hachier[a.text] = array_mail
     # 	array[i] = hachier
     # 	i = i + 1
    #end
    #print array
end

get_prenom_urls