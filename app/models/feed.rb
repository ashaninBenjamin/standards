class Feed < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  state_machine :state, initial: :unpublished do
    state :unpublished
    state :published

    event :publish do
      transition from: :unpublished, to: :published, if: :persisted?
    end

    event :unpublish do
      transition from: :published, to: :unpublished, if: :persisted?
    end
  end

  include FeedRepository
end
