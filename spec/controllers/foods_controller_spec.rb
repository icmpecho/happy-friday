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

describe FoodsController do

  # This should return the minimal set of attributes required to create a valid
  # Food. As you add validations to Food, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "delivered_date" => "2014-02-21" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FoodsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all foods as @foods" do
      food = Food.create! valid_attributes
      get :index, {}, valid_session
      assigns(:foods).should eq([food])
    end
  end

  describe "GET show" do
    it "assigns the requested food as @food" do
      food = Food.create! valid_attributes
      get :show, {:id => food.to_param}, valid_session
      assigns(:food).should eq(food)
    end
  end

  describe "GET new" do
    it "assigns a new food as @food" do
      get :new, {}, valid_session
      assigns(:food).should be_a_new(Food)
    end
  end

  describe "GET edit" do
    it "assigns the requested food as @food" do
      food = Food.create! valid_attributes
      get :edit, {:id => food.to_param}, valid_session
      assigns(:food).should eq(food)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Food" do
        expect {
          post :create, {:food => valid_attributes}, valid_session
        }.to change(Food, :count).by(1)
      end

      it "assigns a newly created food as @food" do
        post :create, {:food => valid_attributes}, valid_session
        assigns(:food).should be_a(Food)
        assigns(:food).should be_persisted
      end

      it "redirects to the created food" do
        post :create, {:food => valid_attributes}, valid_session
        response.should redirect_to(Food.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved food as @food" do
        # Trigger the behavior that occurs when invalid params are submitted
        Food.any_instance.stub(:save).and_return(false)
        post :create, {:food => { "delivered_date" => "invalid value" }}, valid_session
        assigns(:food).should be_a_new(Food)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Food.any_instance.stub(:save).and_return(false)
        post :create, {:food => { "delivered_date" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested food" do
        food = Food.create! valid_attributes
        # Assuming there are no other foods in the database, this
        # specifies that the Food created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Food.any_instance.should_receive(:update).with({ "delivered_date" => "2014-02-21" })
        put :update, {:id => food.to_param, :food => { "delivered_date" => "2014-02-21" }}, valid_session
      end

      it "assigns the requested food as @food" do
        food = Food.create! valid_attributes
        put :update, {:id => food.to_param, :food => valid_attributes}, valid_session
        assigns(:food).should eq(food)
      end

      it "redirects to the food" do
        food = Food.create! valid_attributes
        put :update, {:id => food.to_param, :food => valid_attributes}, valid_session
        response.should redirect_to(food)
      end
    end

    describe "with invalid params" do
      it "assigns the food as @food" do
        food = Food.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Food.any_instance.stub(:save).and_return(false)
        put :update, {:id => food.to_param, :food => { "delivered_date" => "invalid value" }}, valid_session
        assigns(:food).should eq(food)
      end

      it "re-renders the 'edit' template" do
        food = Food.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Food.any_instance.stub(:save).and_return(false)
        put :update, {:id => food.to_param, :food => { "delivered_date" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested food" do
      food = Food.create! valid_attributes
      expect {
        delete :destroy, {:id => food.to_param}, valid_session
      }.to change(Food, :count).by(-1)
    end

    it "redirects to the foods list" do
      food = Food.create! valid_attributes
      delete :destroy, {:id => food.to_param}, valid_session
      response.should redirect_to(foods_url)
    end
  end

end
