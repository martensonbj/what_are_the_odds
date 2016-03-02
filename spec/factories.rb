FactoryGirl.define do
  factory :friend do
    name "MyString"
  end
  factory :challenge do
    title "MyString"
    assigned_user "MyString"
    expiration_date "2016-02-29 18:51:19"
    message "MyString"
    video "MyString"
  end
  factory :user do
    provider "MyString"
    uid "MyString"
    name "MyString"
    link "MyString"
    picture "MyString"
    email "MyString"
    phone "MyString"
    token "MyString"
  end
end