class TwilioController < ApplicationController
  
  include TwilioHelper
  
  HELP_COMMAND = "info"
  LEVELS_COMMAND = "levels"
  AVAILABLE_COMMANDS = [HELP_COMMAND, LEVELS_COMMAND]
  HELP_TEXT = "Text in a level report or text in \'levels\' for the latest info"

  # parses incoming SMS messages from the Twilio numbers
  # if a command is given, returns an appropriate response
  # otherwise generates a new report object with the appropriate region and source
  def incoming_sms
    if params[:From]
      phone = "(" + params[:From][2..4] + ")" + " " + params[:From][5..7] + "-" + params[:From][8..11]
    end
    
    if params[:To]
      twilio_number = "(" + params[:To][2..4] + ")" + " " + params[:To][5..7] + "-" + params[:To][8..11]
      region = Region.find_by_phone_number(twilio_number)
    end
    
    # parse the SMS :Body for commands and return the response as XML to Twilio
    if  AVAILABLE_COMMANDS.include? params[:Body].downcase
      case params[:Body].downcase
      when HELP_COMMAND
        response_text = HELP_TEXT
      when LEVELS_COMMAND
        response_text = Report.levels_sms_response(region)
      else 
        response_text = "Unknown command"
      end
    # if no command found, attempt to create a new report
    else 
      @report = Report.new(:report => params[:Body], :phone => phone, :region => region)
      if @report.save
        response_text = nil
      else
        response_text = "there was an error: " + @report.errors
      end
    end
              
    twiml = Twilio::TwiML::Response.new do |r|
      long_sms_split(r, response_text)
    end
    render :xml => twiml.text
    return
    
  end
  
  
end