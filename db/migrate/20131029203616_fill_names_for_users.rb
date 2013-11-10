class FillNamesForUsers < ActiveRecord::Migration
  def change
    User.find_each do |user|
      user.names = "#{user.first_name} #{user.last_name}"
      user.save!
    end
  end
end
