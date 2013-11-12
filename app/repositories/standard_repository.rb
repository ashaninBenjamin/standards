module StandardRepository
  extend ActiveSupport::Concern
  include BaseRepository

  included do
    state_machine.states.each do |s|
      scope s.name, -> { where(state: s.name) }
    end

    def self.get_by_link(link)
      numbers = link.split('-').map { |number_s| number_s.to_i }

      standard = roots.first
      numbers.each do |number|
        standard = standard.children.with(number: number).first
        break unless standard
      end
      standard
    end

    def self.stem
      roots.first.descendants
    end

    def father
      parent if parent.number != 0
    end

    scope :public, -> (user) {
      copied_from_ids = user.standards.map(&:copied_from_id) - [nil]
      published.where('user_id != ?', user.id).where('id NOT IN (?)', copied_from_ids.any? ? copied_from_ids : 0)
    }

    scope :several, -> (ids) { ids ? where(id: ids) : all }
  end

end
