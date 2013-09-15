class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.string :name
      t.string :content
      t.integer :number
      t.integer :user_id
      t.integer :parent_id
      t.string :state
      t.string :access_state

      t.timestamps
    end
  end
end
