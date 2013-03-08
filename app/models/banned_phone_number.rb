class BannedPhoneNumber < ActiveRecord::Base
  attr_accessible :banned, :user_id, :phone
  
end
