module StandardRepository
  extend ActiveSupport::Concern
  include BaseRepository

  included do
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

    scope :public, -> (user) { where(access_state: :public).where('user_id != ?', user.id) }
  end

end
