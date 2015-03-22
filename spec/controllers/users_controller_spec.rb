require 'rails_helper'

RSpec.describe UsersController, type: :controller do
render_views
  describe UsersController
    
  
  
  describe "GET 'show'" do
    
    before(:each) do
      @user = Factory(:user)
    end
    
    it "should be succesful" do
      get :show, :id => @user
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user
      assign(:user).should == @user
    end
  end
  
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    
    it "should have the right title" do
        get :index
	expect(response).to have_selector('title', :content =>"All users")
      end
    
  end
  
  
  

end
