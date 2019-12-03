# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deal do
    title "MyString"
    description "MyText"
    image "MyString"
    start_date "2013-09-13"
    end_date "2013-09-13"
    status "MyString"
  end
end
