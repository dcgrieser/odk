FactoryGirl.define do
  factory :user do
    first_name "Foo"
    last_name "Bar"
    email { Factory.next :email }
    password "password"
    initiation_date "2011-12-10"
    active false
  end

  factory :student, :class => Student, :parent => :user do
  end

  factory :faculty, :class => Faculty, :parent => :user do
    title "faculty"
  end

  sequence(:email) {|i| "foo_#{i}@bar.com"}
end
