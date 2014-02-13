require 'spec_helper'

describe "food_finder_teams/index" do
  before(:each) do
    assign(:food_finder_teams, [
      stub_model(FoodFinderTeam,
        :name => "Name",
        :weight => 1
      ),
      stub_model(FoodFinderTeam,
        :name => "Name",
        :weight => 1
      )
    ])
  end

  # it "renders a list of food_finder_teams" do
  #   render
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   assert_select "tr>td", :text => "Name".to_s, :count => 2
  #   assert_select "tr>td", :text => 1.to_s, :count => 2
  # end
end
