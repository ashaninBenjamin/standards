class ChangeOldContentInStandards < ActiveRecord::Migration
  def change
    remove_column :standards, :old_content, :string
    add_column :standards, :old_content, :text
  end
end
