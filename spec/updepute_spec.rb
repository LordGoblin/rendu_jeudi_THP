require_relative '../lib/updepute'

describe "the depute method" do
	it "countain the FN symbol" do
		expect(get_prenom_urls2.any?{"lepen" == nil}).to eq(false)
	end
end

describe "the depute method" do
	it "contain Sabine" do
		expect(get_prenom_urls2.any?{"Abba" == nil}).to eq(false)
	end
end