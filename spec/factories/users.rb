# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :name do |n|
    "name#{n}"
  end

  sequence :email do |n|
    "email#{n}@abctech-thailand.com"
  end

  sequence :uid do |n|
    "#{n}"
  end

  factory :user do
    name
    email
    uid
    active true
    weight 1
  end

end
