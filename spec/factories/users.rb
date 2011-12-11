# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    password_digest "MyString"
    initiation_date "2011-12-10"
    type ""
    active false
  end
end
