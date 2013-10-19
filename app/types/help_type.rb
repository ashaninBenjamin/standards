class HelpType
  include BaseTypeWithoutActiveRecord

  attribute :email, String
  attribute :name, String
  attribute :subject, String
  attribute :message, String

  validates :email, presence: true, email: true
  validates :name, presence: true
  validates :message, presence: true
end
