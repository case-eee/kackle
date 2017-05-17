FactoryGirl.define do
  factory :user do
    email "mail@mail.com"
    phone "500-400-3000"
    password "pass"
    password_confirmation "pass"
    active true
  end

  factory :joke do
    question "What kind of car does Mickey Mouse's wife drive?"
    answer "A minnie van!"
  end
end
