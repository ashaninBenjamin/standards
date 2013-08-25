class ClientType < Client
  include BaseType

  has_secure_password

  permit :email, :password, :password_confirmation, :first_name, :last_name

end
