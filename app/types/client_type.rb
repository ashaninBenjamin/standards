class ClientType < Client
  include BaseType

  permit :email, :password, :password_confirmation, :first_name, :last_name

end
