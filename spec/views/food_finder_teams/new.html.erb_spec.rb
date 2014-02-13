require 'spec_helper'

describe "food_finder_teams/new" do
  before(:each) do
    assign(:food_finder_team, stub_model(FoodFinderTeam,
      :name => "MyString",
      :weight => 1
    ).as_new_record)
  end

  it "renders new food_finder_team form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", food_finder_teams_path, "post" do
      assert_select "input#food_finder_team_name[name=?]", "food_finder_team[name]"
      assert_select "input#food_finder_team_weight[name=?]", "food_finder_team[weight]"
    end
  end
end
