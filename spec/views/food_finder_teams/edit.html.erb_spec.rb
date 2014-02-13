require 'spec_helper'

describe "food_finder_teams/edit" do
  before(:each) do
    @food_finder_team = assign(:food_finder_team, stub_model(FoodFinderTeam,
      :name => "MyString",
      :weight => 1
    ))
  end

  it "renders the edit food_finder_team form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", food_finder_team_path(@food_finder_team), "post" do
      assert_select "input#food_finder_team_name[name=?]", "food_finder_team[name]"
      assert_select "input#food_finder_team_weight[name=?]", "food_finder_team[weight]"
    end
  end
end
