# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    phone "(888) 888-8888"
    email ""
    report "This is a reasonable length report"
  end
end
