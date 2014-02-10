class AddCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text, null: false
      t.integer :prompt_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
