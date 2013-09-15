# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email
    first_name
    last_name
    password { generate :string }
    password_confirmation { password }
  end
end
