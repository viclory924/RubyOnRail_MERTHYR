# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :business do
    name "MyString"
    category "MyString"
    address "MyString"
    town "MyString"
    postcode "MyString"
    telephone "MyString"
    website "MyString"
    email "MyString"
    twitter "MyString"
    facebook false
    services "MyText"
    profile "MyText"
    lat 1.5
    lon 1.5
  end
end
