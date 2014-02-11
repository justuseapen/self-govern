class AddArchiveColumnToPromptsTable < ActiveRecord::Migration
  def change
    add_column :prompts, :archive, :boolean, default: false
  end
end
