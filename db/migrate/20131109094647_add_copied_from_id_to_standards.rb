class AddCopiedFromIdToStandards < ActiveRecord::Migration
  def change
    add_column :standards, :copied_from_id, :integer
  end
end
