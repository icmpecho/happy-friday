require 'spec_helper'

describe User do

	describe 'Class methods' do
		describe 'with out data' do
			it 'return 0' do
				expect(User.max_weight).to eq 0
				expect(User.min_weight).to eq 0
			end
		end
		describe 'with data' do
			foo = nil
			bar = nil
			baz = nil
			before do
				foo = FactoryGirl.create(:user, name: 'Foo', weight: 2)
				bar = FactoryGirl.create(:user, name: 'Bar', weight: 3)
				baz = FactoryGirl.create(:user, name: 'Baz', weight: 4)
			end
			it 'return correct min_weight' do
				expect(User.min_weight).to eq 2
			end
			it 'return correct max_weight' do
				expect(User.max_weight).to eq 4
			end
			it 'can create weight slot' do
				User.create_weight_slot!(3)
				foo.reload
				bar.reload
				baz.reload
				expect(foo.weight).to eq 1
				expect(bar.weight).to eq 2
				expect(baz.weight).to eq 4
			end
		end
	end

	describe 'Object methods' do
		foo = nil
		bar = nil
		baz = nil
	  before do
			foo = FactoryGirl.create(:user, name: 'Foo', weight: 2, email: 'pinnapong@gmail.com')
			bar = FactoryGirl.create(:user, name: 'Bar', weight: 3)
			baz = FactoryGirl.create(:user, name: 'Baz', weight: 5)
			inactive = FactoryGirl.create(:user, name: 'InActive', weight: 4, active: false)
			Date.stub(:today).and_return(Date.new(2013,12,24))
		end
		it 'return correct next_talk' do
			expect(foo.next_talk).to eq Date.new(2013,12,27)
			expect(bar.next_talk).to eq Date.new(2014,1,3)
			expect(baz.next_talk).to eq Date.new(2014,1,10)
		end
		it 'return correct next_talk with skips' do
			FactoryGirl.create(:no_techtalk_day, date: Date.new(2014,1,3))
			FactoryGirl.create(:no_techtalk_day, date: Date.new(2014,1,10))
			FactoryGirl.create(:no_techtalk_day, date: Date.new(2014,1,17))
			expect(foo.next_talk).to eq Date.new(2013,12,27)
			expect(bar.next_talk).to eq Date.new(2014,1,24)
			expect(baz.next_talk).to eq Date.new(2014,1,31)
		end
		it 'can use volunteer method' do
			bar.volunteer!
			expect(bar.next_talk).to eq Date.new(2013,12,27)
			expect(foo.next_talk).to eq Date.new(2014,1,3)
		end
		it 'can use voluteer method with param' do
			baz.volunteer!(1)
			foo.reload
			bar.reload
			baz.reload
			expect(foo.weight).to eq 1
			expect(foo.next_talk).to eq Date.new(2013,12,27)
			expect(baz.weight).to eq 2
			expect(baz.next_talk).to eq Date.new(2014,1,3)
			expect(bar.weight).to eq 3
			expect(bar.next_talk).to eq Date.new(2014,1,10)
		end
		it 'can not use volunteer to postpone talk' do
			ret = foo.volunteer!(2)
			foo.reload
			bar.reload
			baz.reload
			expect(ret).to eq false
			expect(foo.next_talk).to eq Date.new(2013,12,27)
			expect(bar.next_talk).to eq Date.new(2014,1,3)
			expect(baz.next_talk).to eq Date.new(2014,1,10)
		end
		it 'can report talk' do
			foo.talked!
			foo.reload
			expect(foo.next_talk).to eq Date.new(2014,1,10)
			expect(foo.weight).to eq 6
		end
		it "know if it's the next one who talk" do
			expect(foo.talk?).to eq true
			expect(bar.talk?).to eq false
			expect(baz.talk?).to eq false
		end
		it 'can return gravatar url' do
			expect(foo.gravatar_url).to eq 'http://www.gravatar.com/avatar/5f80e4fdf5ca6a812c2c4457c11e2442'
		end
	end

end
