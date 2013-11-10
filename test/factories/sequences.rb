FactoryGirl.define do
  sequence :string, aliases: [:names, :name, :content, :subject, :message, :old_name] do |n|
    "string-#{n}"
  end

  sequence :email do |n|
    "email#{n}@test.ru"
  end
end
