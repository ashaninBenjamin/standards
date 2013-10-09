class Admin < User
  has_secure_password validations: false
  include AdminRepository
end
