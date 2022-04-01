class RenameColumnUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.rename :IsAdmin, :admin
    end
  end
end
