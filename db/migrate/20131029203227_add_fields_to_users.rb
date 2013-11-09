class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :opf, :string
    add_column :users, :company_name, :string
    add_column :users, :company_city, :string
    add_column :users, :phone_numbe, :string
    add_column :users, :names, :string
  end
end
