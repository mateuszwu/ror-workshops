class AddPointsToBets < ActiveRecord::Migration[7.0]
  def change
    add_column :bets, :points, :integer, :default => 0
  end
end
