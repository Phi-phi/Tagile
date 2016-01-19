class ChangeColumnToUploads < ActiveRecord::Migration
  def change
    change_column :uploads, :user_id, :integer, null: false
  end
end
