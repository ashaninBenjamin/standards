class ChangeContentInStandards < ActiveRecord::Migration
  def change
    change_column :standards, :content, :text
  end
end
