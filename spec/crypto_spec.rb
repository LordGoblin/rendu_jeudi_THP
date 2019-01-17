
require_relative '../lib/crypto'

describe "the crypto method" do
	it "countain the BitCoin symbol" do
		expect(cryptop.any?{"ETH" == nil}).to eq(false)
	end
end