module TwilioHelper
  
  def long_sms_split(r, sms_text)
    if sms_text && sms_text.length > 160
      responses = []
      until sms_text.length == 0
        responses.append(sms_text.slice!(0..153))
      end
      i = 1
      responses.each do |resp|
        resp += "(#{i}/#{responses.length})"
        r.Sms resp
        i += 1
      end
    else
      r.Sms sms_text
    end
  end
  
end