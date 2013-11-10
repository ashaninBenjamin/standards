class Client < User
  has_secure_password validations: false
  include ClientRepository

  has_many :standards, foreign_key: 'user_id'

  validates :names, presence: true
  validates :password, confirmation: true

  after_create :add_root

  def to_s
    names
  end

  def add_root
    root = standards.build(name: "root", number: 0)
    root.save
  end

  def generate_confirmation_token
    self.confirmation_token = Token.generate
  end
end
