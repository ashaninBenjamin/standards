class RemoveParentIdFromStandards < ActiveRecord::Migration
  def change
    remove_column :standards, :parent_id, :integer
  end
end
