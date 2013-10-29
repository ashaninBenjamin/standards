FactoryGirl.define do
  sequence :string, aliases: [:names, :name, :content, :subject, :message] do |n|
    "string-#{n}"
  end

  sequence :email do |n|
    "email#{n}@test.ru"
  end
end
