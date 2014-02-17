class AddImmutableToPrompts < ActiveRecord::Migration
  def change
    add_column :prompts, :immutable, :boolean
  end
end
