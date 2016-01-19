class AddColumnToTags < ActiveRecord::Migration
  def change
    add_column :tags, :name, :string, null: false
    add_column :tags, :user_id, :integer, null: false

  end
end
