FactoryGirl.define do
  factory :role do
    title Role::TITLES.first
    term_start_year { Factory.next :year }
    user
  end

  sequence(:year) {|i| sprintf("%04d", 1949 + i)}
end
