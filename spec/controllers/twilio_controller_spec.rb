require 'spec_helper'
include TwilioHelper

describe TwilioController do

  describe "POST 'incoming_sms'" do
    
    describe "with new report" do
      it "should create a new report" do
        report_count = Report.count
        post 'incoming_sms', :Body => "Hello, this is a report", :From => "+18008888888"
        Report.count.should == report_count + 1
      end
      
      describe "with region matching the incoming phone number" do
        it "should create a new report in said region" do
          report_count = Report.count
          region = Region.new(name: "Test Region", phone_number: "(800) 808-8080")
          region.save
          post 'incoming_sms', :Body => "Hello, this is a report in region Test Region", :From => "+18008888888", :To => "+18008088080"
          Report.count.should == report_count + 1
          region.reports.count.should == 1
        end
      end
    end
    
    describe "with query commands" do
      describe "should respond to the query" do
        it "\'help\' should return appropriate message" do
          twiml = Twilio::TwiML::Response.new do |r|
            r.Sms TwilioController::HELP_TEXT
          end
          post 'incoming_sms', :Body => TwilioController::HELP_COMMAND
          response.body.should == twiml.text
        end
        
        it "\'levels\' should return the defined # of most recent reports" do
          4.times do FactoryGirl.create(:report) end
          post 'incoming_sms', :Body => "levels"
          twiml = Twilio::TwiML::Response.new do |r| 
            long_sms_split(r, Report.levels_sms_response)
          end
          response.body.should == twiml.text
        end
        
      end
    end
  
  end
  
end
