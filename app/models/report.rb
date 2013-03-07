class Report < ActiveRecord::Base
  before_save :assign_to_user
  
  attr_accessible :email, :phone, :report, :user_id
  belongs_to :user
  
  default_scope order("created_at DESC")
  
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
      
    
  
  
end
