class AddColumnToLinks < ActiveRecord::Migration
  def change
    add_column :links, :tag_id, :integer, null: false
    add_column :links, :upload_id, :integer, null: false
  end
end
