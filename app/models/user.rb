class User < ActiveRecord::Base
  has_secure_password validations: false

  validates :email, uniqueness: true, presence: true, email: true

  state_machine :state, initial: :active do
    state :inactive
    state :active

    event :activate do
      transition from: :inactive, to: :active, if: :persisted?
    end

    event :inacticate do
      transition from: :active, to: :deleted, if: :persisted?
    end
  end

  include UserRepository
end
