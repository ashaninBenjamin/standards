Configus.build Rails.env do
  env :production do
    action_mailer do
      default_host '1standart.com'
      default_from '1st@1standart.com'
    end
    techical_support_email '1standard.dev@gmail.com'
  end

  env :development, parent: :production

  env :test, parent: :development
end
