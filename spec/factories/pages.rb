# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title "MyString"
    body "MyText"
    parent_id 1
    permalink "MyString"
    page_template_id 1
    status false
  end
end
