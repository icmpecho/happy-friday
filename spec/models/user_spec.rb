require 'spec_helper'

describe User do

	foo = nil
	bar = nil

  before do
		foo = FactoryGirl.create(:user, name: 'Foo', weight: 2)
		bar = FactoryGirl.create(:user, name: 'Bar', weight: 3)
	end

	describe 'Class methods' do
		it 'return correct min_weight' do
			expect(User.min_weight).to eq 2
		end
		it 'return correct max_weight' do
			expect(User.max_weight).to eq 3
		end
	end

	describe 'Object methods' do
		before do
			Date.stub(:today).and_return(Date.new(2013,12,24))
		end
		it 'return correct next_talk' do
			expect(foo.next_talk).to eq Date.new(2013,12,27)
			expect(bar.next_talk).to eq Date.new(2014,1,3)
		end
	end

end
