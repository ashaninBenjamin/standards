class AdminSignInType
  include BaseTypeWithoutActiveRecord

  attribute :email, String
  attribute :password, String

  validates :email, presence: true, email: true
  validates :password, presence: true

  validate :check_authenticate

  def admin
    Admin.find_by_email(email)
  end

  private

  def check_authenticate
    errors.add(:password, :user_or_password_invalid) unless admin.try(:authenticate, password)
  end
end