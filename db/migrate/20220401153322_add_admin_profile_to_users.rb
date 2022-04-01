class AddAdminProfileToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin_profile, :boolean, default: false, null: false
  end
end
