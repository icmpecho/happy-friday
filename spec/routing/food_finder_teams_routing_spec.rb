require "spec_helper"

describe FoodFinderTeamsController do
  describe "routing" do

    it "routes to #index" do
      get("/food_finder_teams").should route_to("food_finder_teams#index")
    end

    it "routes to #new" do
      get("/food_finder_teams/new").should route_to("food_finder_teams#new")
    end

    it "routes to #show" do
      get("/food_finder_teams/1").should route_to("food_finder_teams#show", :id => "1")
    end

    it "routes to #edit" do
      get("/food_finder_teams/1/edit").should route_to("food_finder_teams#edit", :id => "1")
    end

    it "routes to #create" do
      post("/food_finder_teams").should route_to("food_finder_teams#create")
    end

    it "routes to #update" do
      put("/food_finder_teams/1").should route_to("food_finder_teams#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/food_finder_teams/1").should route_to("food_finder_teams#destroy", :id => "1")
    end

  end
end
