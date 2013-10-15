class RemoveAccessStateFromStandards < ActiveRecord::Migration
  def change
    remove_column :standards, :access_state, :string
  end
end
