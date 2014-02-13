require 'spec_helper'

describe FoodFinderTeam do
  before do
    FactoryGirl.create(:food_finder_team, name: 'Team1', weight: 1)
    FactoryGirl.create(:food_finder_team, name: 'Team1', weight: 2)
  end
  it "return correct max_weight" do
    FoodFinderTeam.max_weight.should eq 2
  end
end
