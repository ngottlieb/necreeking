# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :banned_phone_number do
    banned true 
    phone "(888) 888-8888"
  end
end
