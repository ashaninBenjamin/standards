class RenamePhoneNumberInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :phone_numbe, :phone_number
  end
end
