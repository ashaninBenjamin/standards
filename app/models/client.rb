class Client < User
  has_secure_password validations: false
  include ClientRepository

  validates :first_name, presence: true
  validates :last_name, presence: true

  def to_s
    "#{first_name} #{last_name}"
  end
end
