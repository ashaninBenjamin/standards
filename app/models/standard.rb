class Standard < ActiveRecord::Base
  before_save :set_root

  has_ancestry
  belongs_to :client, foreign_key: 'user_id'

  validates :name, presence: true
  validates :number, presence: true, unique_number: true
  validates :client, presence: true

  state_machine :state, initial: :refrained do
    state :refrained
    state :active
    state :published
    state :deleted

    event :activate do
      transition from: [:refrained, :deleted], to: :active, if: :persisted?
    end

    event :refrain do
      transition from: [:deleted, :active], to: :refrained, if: :persisted?
    end

    event :publish do
      transition from: :active, to: :published, if: :persisted?
    end

    event :del do
      transition from: [:refrained, :active, :deleted], to: :deleted, if: :persisted?
    end

    event :unpublish do
      transition from: :published, to: :active, if: :persisted?
    end
  end

  include StandardRepository

  def self.sort_standards_by_code(standards)
    standards.sort_by { |a| a.code.split('.').map &:to_i }
  end

  def node_numbers
    if (children.empty?)
      return [1]
    end
    sorted_children = children.by_number
    last_number = sorted_children.first.number + 1
    array = (1..last_number).to_a
    sorted_children.each do |one|
      array.delete(one.number)
    end
    array
  end

  def code
    code = number.to_s
    temp = self
    while temp.parent && temp.parent.number.nonzero?
      temp = temp.parent
      code = "#{temp.number}.#{code}"
    end
    code
  end

  def link
    code.gsub(".", "-")
  end

  def available_number
    sorted_children = children.by_number
    if sorted_children.any?
      sorted_children.first.number + 1
    else
      1
    end
  end

  def to_s
    name
  end

  private

  def set_root
    return if number.zero?
    self.parent = client.standards.roots.first unless parent_id
  end
end
