FactoryGirl.define do
  factory :role do
    title Role::TITLES.first
    term_start_year "2011"
    association :user
  end
end
