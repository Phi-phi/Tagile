class ChangeColumnToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :user_id, :integer, null: false
    add_column :uploads, :name, :string, null: false
  end
end
