class RemoveSurenameFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :surename, :string
  end
end
