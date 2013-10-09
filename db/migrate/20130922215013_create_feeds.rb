class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.text :content
      t.string :state

      t.timestamps
    end
  end
end
