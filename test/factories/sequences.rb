FactoryGirl.define do
  sequence :string, aliases: [:first_name, :last_name, :name, :content] do |n|
    "string-#{n}"
  end

  sequence :email do |n|
    "email#{n}@test.ru"
  end
end
