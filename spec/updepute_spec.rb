require_relative '../lib/updepute'

describe "the depute method" do
	it "countain the FN symbol" do
		expect(get_prenom_urls.any?{"lepen" == nil}).to eq(false)
	end
end

describe "the depute method" do
	it "contain Sabine" do
		expect(get_prenom_urls.any?{"Abba" == nil}).to eq(false)
	end
end