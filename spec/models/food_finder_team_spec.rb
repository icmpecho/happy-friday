require 'spec_helper'

describe FoodFinderTeam do
  team1 = nil;
  team2 = nil;
  before do
    team1 = FactoryGirl.create(:food_finder_team, name: 'Team1', weight: 1)
    team2 = FactoryGirl.create(:food_finder_team, name: 'Team1', weight: 2)
  end
  it "return correct max_weight" do
    FoodFinderTeam.max_weight.should eq 2
  end
  it "can change weight after delivered" do
    team1.delivered!
    team1.weight.should eq 3
    team1.delivered!
    team1.weight.should eq 3
  end
end
