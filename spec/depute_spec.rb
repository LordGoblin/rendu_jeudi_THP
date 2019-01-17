require_relative '../lib/depute'

describe "the depute method" do
	it "countain the FN symbol" do
		expect(get_prenom_urls.any?{"lepen" == nil}).to eq(false)
	end
end

describe "the depute method" do
	it "contain Abba" do
		expect(get_prenom_urls.any?{"Abba" == nil}).to eq(false)
	end
end