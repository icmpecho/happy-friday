require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the DateHelper. For example:
#
# describe DateHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe DateHelper do
	it 'return correct next_friday' do
		Date.stub(:today).and_return(Date.new(2013,12,24))
		expect(helper.next_friday).to eq Date.new(2013,12,27)
		expect(helper.next_friday(1)).to eq Date.new(2014,1,3)
	end
end
