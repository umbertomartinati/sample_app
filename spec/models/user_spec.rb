require 'rails_helper'

RSpec.describe User, type: :model do
  
   before(:each) do
    @attr = { 
      :name => "Example User",
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
  end
  
  it "should create a new instance given valid attr" do
    User.create! @attr
  end
  
  it" should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  
  it "should reject name that are too long" do
    long_name = "a"*51
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end
  
  
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:name => address))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org first.last@foo]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:name => address))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    User.create! @attr
    user_with_duplicate_email = User.new @attr
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  describe "password validation" do
    
    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => ""))
      should_not be_valid
    end
    
    it "should require a matching password confirmation " do
      User.new(@attr.merge(:password_confirmation => ""))
      should_not be_valid
    end
    
    it "should reject short password" do
      short = "a"*5;
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end
    
    it "should reject long password" do
      long = "a"*41;
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
  end
                  
  
  describe "password encryption" do
    before(:each) do
      @user = User.create @attr
    end
    
    it "should have an encrypted password attr" do
      @user.should respond_to(:encrypted_password)
    end
    
    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
      end
      
      describe "has_password? method" do

      it "should exist" do
        @user.should respond_to(:has_password?)
      end

      it "should return true if the passwords match" do
        @user.has_password?(@attr[:password]).should be_true
      end
      
      it "should return false if the passwords don't match" do
        @user.has_password?("invalid").should be_false
      end
    end
    
    describe "authenticate method" do
      it "should return nil or email/password mismatch" do
	wrong_password_user = User.authenticate(@attr[:email], "wrongpass")
	wrong_password_user.should be_nil
      end
      
      it "should return nil for an email adress with no user" do
	nonexist_user = User.authenticate("bar@foo.com", @attr[:password])
	nonexist_user.should be_nil
      end
      
      it "should return the user on email/pass match" do
	match_user = User.authenticate(@attr[:email], @attr[:password])
	match_user.should == @user
      end
    end
    
      
  end
  
  
  
  
  
  
  
end

# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

