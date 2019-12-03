# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :business_category_template do
    category "MyString"
    body "MyText"
    image "MyString"
  end
end
