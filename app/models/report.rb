class Report < ActiveRecord::Base
  attr_accessible :email, :phone, :report, :user_id
  belongs_to :user
  
  default_scope order("created_at DESC")
  
  def source
    self.email || self.phone
  end
  
  
end
