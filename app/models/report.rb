class Report < ActiveRecord::Base
  
  REPORTS_FOR_LEVELS_RESPONSE = 3
  
  before_save :assign_to_user
  
  attr_accessible :email, :phone, :report, :user_id
  belongs_to :user
  
  validate :source_not_banned
  
  after_create :post_to_twitter
  
  default_scope order("created_at DESC")
  
  def post_to_twitter
    Twitter.configure do |config|
      config.consumer_key = "Dxsba4cHgW2FBuoNQ02aw"
      config.consumer_secret = "24R8v1roKe9jCmBUJWhnFNY8FqVLRUvEwpkAOXVPA"
      config.oauth_token = "173942897-IaQsMsz2NByKMOyVRw0C5y2UYRolmXQCHihZ9wIp"
      config.oauth_token_secret = "FJg1Pd6ywSUEN8Irx0DF5SroKAJHyA6FXfzZzCPA8"
    end
    Twitter.update(self.report)
  end
  
  def source
    self.email || self.phone
  end

  def assign_to_user
    if !self.email.nil? && !self.email.empty?
      user = User.find_by_email(self.email)
    elsif !self.phone.nil? && !self.phone.empty?
      user = User.find_by_phone(self.phone)
    end
    if user
      self.user = user
    end
  end
  
  def source_not_banned
    if BannedPhoneNumber.where(phone: self.phone).exists?
      errors.add(:phone, "phone number banned")
    end
  end
  
  # TODO: refactor this formatting into a view somehow
  def self.levels_sms_response
    i = 0
    response_text = ""
    Report.limit(REPORTS_FOR_LEVELS_RESPONSE).each do |r| 
      i += 1
      if r.user && r.user.name
        response_text += r.user.name + ": "
      end
      response_text += r.report + " -- " + r.created_at.strftime("%m/%d/%y - %I:%M%p")
      if i < REPORTS_FOR_LEVELS_RESPONSE
        response_text += " | "
      end
    end
    return response_text
  end
  
end
