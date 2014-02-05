class AddPromptsTable < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.text :text, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
