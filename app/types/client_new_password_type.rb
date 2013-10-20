class ClientNewPasswordType
  include BaseTypeWithoutActiveRecord

  attribute :email, String

  validates :email, presence: true, email: true

  validate :check_client, if: :email

  def client
    Client.where(email: email.mb_chars.downcase).first
  end

  private

  def check_client
    errors.add(:email, :user_not_found) unless client
  end
end
