class ClientSignInType
  include BaseTypeWithoutActiveRecord

  attribute :email, String
  attribute :password, String

  validates :email, presence: true
  validates :password, presence: true

  validate :check_authenticate

  def client
    Client.active.find_by email: email
  end

  private

  def check_authenticate
    errors.add(:password, :user_or_password_invalid) unless client.try(:authenticate, password)
  end
end
