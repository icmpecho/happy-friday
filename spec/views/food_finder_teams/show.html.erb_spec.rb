require 'spec_helper'

describe "food_finder_teams/show" do
  before(:each) do
    @food_finder_team = assign(:food_finder_team, stub_model(FoodFinderTeam,
      :name => "Name",
      :weight => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
