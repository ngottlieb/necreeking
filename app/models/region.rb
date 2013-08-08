class Region < ActiveRecord::Base
  
  has_and_belongs_to_many :users
  has_many :reports

  validates_uniqueness_of :name, :phone_number
  
  attr_accessible :name, :phone_number
  
end
