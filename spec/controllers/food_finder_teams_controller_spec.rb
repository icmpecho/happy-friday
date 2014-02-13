require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FoodFinderTeamsController do

  # This should return the minimal set of attributes required to create a valid
  # FoodFinderTeam. As you add validations to FoodFinderTeam, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FoodFinderTeamsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all food_finder_teams as @food_finder_teams" do
      food_finder_team = FoodFinderTeam.create! valid_attributes
      get :index, {}, valid_session
      assigns(:food_finder_teams).should eq([food_finder_team])
    end
  end

  describe "GET show" do
    it "assigns the requested food_finder_team as @food_finder_team" do
      food_finder_team = FoodFinderTeam.create! valid_attributes
      get :show, {:id => food_finder_team.to_param}, valid_session
      assigns(:food_finder_team).should eq(food_finder_team)
    end
  end

  describe "GET new" do
    it "assigns a new food_finder_team as @food_finder_team" do
      get :new, {}, valid_session
      assigns(:food_finder_team).should be_a_new(FoodFinderTeam)
    end
  end

  describe "GET edit" do
    it "assigns the requested food_finder_team as @food_finder_team" do
      food_finder_team = FoodFinderTeam.create! valid_attributes
      get :edit, {:id => food_finder_team.to_param}, valid_session
      assigns(:food_finder_team).should eq(food_finder_team)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FoodFinderTeam" do
        expect {
          post :create, {:food_finder_team => valid_attributes}, valid_session
        }.to change(FoodFinderTeam, :count).by(1)
      end

      it "assigns a newly created food_finder_team as @food_finder_team" do
        post :create, {:food_finder_team => valid_attributes}, valid_session
        assigns(:food_finder_team).should be_a(FoodFinderTeam)
        assigns(:food_finder_team).should be_persisted
      end

      it "redirects to the created food_finder_team" do
        post :create, {:food_finder_team => valid_attributes}, valid_session
        response.should redirect_to(FoodFinderTeam.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved food_finder_team as @food_finder_team" do
        # Trigger the behavior that occurs when invalid params are submitted
        FoodFinderTeam.any_instance.stub(:save).and_return(false)
        post :create, {:food_finder_team => { "name" => "invalid value" }}, valid_session
        assigns(:food_finder_team).should be_a_new(FoodFinderTeam)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FoodFinderTeam.any_instance.stub(:save).and_return(false)
        post :create, {:food_finder_team => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested food_finder_team" do
        food_finder_team = FoodFinderTeam.create! valid_attributes
        # Assuming there are no other food_finder_teams in the database, this
        # specifies that the FoodFinderTeam created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FoodFinderTeam.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => food_finder_team.to_param, :food_finder_team => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested food_finder_team as @food_finder_team" do
        food_finder_team = FoodFinderTeam.create! valid_attributes
        put :update, {:id => food_finder_team.to_param, :food_finder_team => valid_attributes}, valid_session
        assigns(:food_finder_team).should eq(food_finder_team)
      end

      it "redirects to the food_finder_team" do
        food_finder_team = FoodFinderTeam.create! valid_attributes
        put :update, {:id => food_finder_team.to_param, :food_finder_team => valid_attributes}, valid_session
        response.should redirect_to(food_finder_team)
      end
    end

    describe "with invalid params" do
      it "assigns the food_finder_team as @food_finder_team" do
        food_finder_team = FoodFinderTeam.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FoodFinderTeam.any_instance.stub(:save).and_return(false)
        put :update, {:id => food_finder_team.to_param, :food_finder_team => { "name" => "invalid value" }}, valid_session
        assigns(:food_finder_team).should eq(food_finder_team)
      end

      it "re-renders the 'edit' template" do
        food_finder_team = FoodFinderTeam.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FoodFinderTeam.any_instance.stub(:save).and_return(false)
        put :update, {:id => food_finder_team.to_param, :food_finder_team => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested food_finder_team" do
      food_finder_team = FoodFinderTeam.create! valid_attributes
      expect {
        delete :destroy, {:id => food_finder_team.to_param}, valid_session
      }.to change(FoodFinderTeam, :count).by(-1)
    end

    it "redirects to the food_finder_teams list" do
      food_finder_team = FoodFinderTeam.create! valid_attributes
      delete :destroy, {:id => food_finder_team.to_param}, valid_session
      response.should redirect_to(food_finder_teams_url)
    end
  end

end