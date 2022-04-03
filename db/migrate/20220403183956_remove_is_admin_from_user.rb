class RemoveIsAdminFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :is_admin, :boolean
  end
end
