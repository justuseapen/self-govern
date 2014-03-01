class AddToDoToPrompts < ActiveRecord::Migration
  def change
    add_column :prompts, :to_do, :boolean, default: false
  end
end
