FactoryGirl.define do
  factory :user do
    email "mail@mail.com"
    phone "500-400-3000"
    password "pass"
    password_confirmation "pass"
    active true
  end
end
