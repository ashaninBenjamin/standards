class AddAncestryToStandards < ActiveRecord::Migration
  def change
    add_column :standards, :ancestry, :string
  end
end
