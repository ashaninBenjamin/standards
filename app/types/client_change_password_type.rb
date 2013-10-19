class ClientChangePasswordType < Client
  has_secure_password
  include BaseType

  permit :password, :password_confirmation
end
