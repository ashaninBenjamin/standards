Configus.build Rails.env do
  env :production do
    action_mailer do
      default_host '1standart.com'
      default_from '1st@1standart.com'
    end
    techical_support_email '1standard.dev@gmail.com'
    tags do
      all ["%опф%", "%компания%", "%город%", "%телефон%"]
      opf "%опф%"
      company_name "%компания%"
      city "%город%"
      phone "%телефон%"
    end
  end

  env :development, parent: :production

  env :test, parent: :development
end
