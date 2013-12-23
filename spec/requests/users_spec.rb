require 'spec_helper'

describe "Users" do
  describe "GET /users" do
  	before do
  		foo = FactoryGirl.create(:user, name: 'Foo')
  		bar = FactoryGirl.create(:user, name: 'Bar')
  	end
    it "send list of users" do
      get users_path
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq 2
    end
  end
end
