require 'spec_helper'

describe Report do
  
  describe "with matching user" do
    
    before do
      @user = FactoryGirl.create(:user)
    end
    
    describe "via phone number" do
      it "should assign user to report" do
        r = FactoryGirl.create(:report, :phone => @user.phone)
        r.user.should == @user
      end
    end
    
    describe "via email" do
      it "should assign user to report" do
        r = FactoryGirl.create(:report, :email => @user.email)
        r.user.should == @user
      end
    end
          
  end
        


end