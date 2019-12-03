# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :business_category_image do
    image "MyString"
    business_category_id 1
  end
end
