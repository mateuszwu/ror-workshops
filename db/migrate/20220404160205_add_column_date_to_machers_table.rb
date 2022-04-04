class AddColumnDateToMachersTable < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :date, :date , null: false
  end
end
