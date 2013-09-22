class Client < User
  has_secure_password validations: false
  include ClientRepository

  has_many :standards, foreign_key: 'user_id'

  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create :add_root

  def to_s
    "#{first_name} #{last_name}"
  end

  private

  def add_root
    root = standards.build(name: "root", number: 0)
    root.save
  end
end
