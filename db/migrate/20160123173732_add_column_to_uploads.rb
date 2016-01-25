class AddColumnToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :name, :string, null: false
    add_column :uploads, :file, :string
  end
end
