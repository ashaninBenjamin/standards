class ClientType < Client
  include BaseType

  has_secure_password

  permit :email, :password, :password_confirmation, :names, :opf, :company_name, :company_city, :phone_number

end
