# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feed do
    title {generate :string}
    content {generate :string}
  end
end
