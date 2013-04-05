require 'spec_helper'

describe TwilioController do

  describe "POST 'incoming_sms'" do
    
    describe "with new report" do
      it "should create a new report" do
        report_count = Report.count
        post 'incoming_sms', :Body => "Hello, this is a report", :From => "+18008888888"
        Report.count.should == report_count + 1
      end
    end
    
    describe "with query commands" do
      describe "should respond to the query" do
        it "\'help\' should return appropriate message" do
          post 'incoming_sms', :Body => "help"
          twiml = Twilio::TwiML::Response.new do |r|
            r.Sms TwilioController::HELP_TEXT
          end
          response.body.should == twiml.text
        end
        
        it "\'levels\' should return the defined # of most recent reports" do
          4.times do FactoryGirl.create(:report) end
          post 'incoming_sms', :Body => "levels"
          twiml = Twilio::TwiML::Response.new do |r|
            r.Sms Report.levels_sms_response
          end
          response.body.should == twiml.text
        end
        
      end
    end
  
  end
  
end
