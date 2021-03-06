require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'xpath'

def get_email(townhall_url)
	page = Nokogiri::HTML(open(townhall_url))
	email = page.xpath('//li[1]/a[contains(@href,"mailto")]').text
	return email
end

def get_prenom_urls
	i = 0
	b = 0
	page = Nokogiri::HTML(open('https://www.nosdeputes.fr/deputes'))
	array_prenom = []
	array_nom =[]
	array_nom2 = []
	array_mail = []
	hachier = {}
	array = []
	profile = page.xpath('//a')
	profile.each do |a|
		array_nom = a['href'][1..-1]
		if array_nom[0..-3] == "deputes" || array_nom.size < 1 || array_nom.include?("ttps") == true || array_nom.include?("faq") == true || array_nom.include?("dossiers") == true || array_nom.include?("groupe") == true || i < 23
			array_nom.clear
		else
			hachier = {}
			array_prenom = array_nom[0..array_nom.index('-')-1]
			array_nom2 = array_nom[array_nom.index('-')+1..-1]
			hachier["first_name"] = array_prenom
			hachier["last_name"] = array_nom2
			array_mail = get_email("https://www.nosdeputes.fr/#{array_nom}")
			hachier["email"] = array_mail
			array[i] = hachier
			puts b
			b = b + 1
		end
		i = i + 1
	end
	return array.compact
end

#print get_prenom_urls