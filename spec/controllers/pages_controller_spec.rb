require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  
  describe PagesController do
    render_views
  
  
  describe "GET '#home'" do
    it "should be successful" do
      get 'home'
            expect(response).to have_http_status(:success)
    end
  
  
  it "should have the right title" do
    get 'home'
<<<<<<< HEAD
    
    
    response.should have_selector("title",:content => "Ruby on Rails Tutorial Sample App | Home" , visible: false)
=======
    response.should have_selector("title:contains('Ruby on Rails Tutorial Sample App | Home')")
>>>>>>> filling-in-layout
  end
  end
  
  
  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end
    
    it "should have the right title" do
      get 'home'
      response.should have_selector("title",
                                  :content => "Ruby on Rails Tutorial Sample App | Contact")
  end
  end

   describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
    
    it "should have the right title" do
      get 'about'
      response.should have_selector("title",
                                  :content => "Ruby on Rails Tutorial Sample App | About")
  end
  end
end



end

