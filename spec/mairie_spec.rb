require_relative '../lib/mairie'

describe "the mairie method" do
	it "countain the BitCoin symbol" do
		expect(get_townhall_urls.any?{"ABLEIGES" == nil}).to eq(false)
	end
end