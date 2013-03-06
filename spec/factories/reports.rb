# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    phone "MyString"
    email "MyString"
    report "MyText"
    user_id 1
  end
end
