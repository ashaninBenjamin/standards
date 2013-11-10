class AddFieldsForRestoringToStandards < ActiveRecord::Migration
  def change
    add_column :standards, :old_content, :string
    add_column :standards, :old_name, :string
  end
end
