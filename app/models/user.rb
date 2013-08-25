class User < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true, email: true

  state_machine :state, initial: :active do
    state :deleted
    state :active

    event :activate do
      transition from: :deleted, to: :active, if: :persisted?
    end

    event :del do
      transition from: :active, to: :deleted, if: :persisted?
    end
  end

  include UserRepository
end
