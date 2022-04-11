class ChangeBetsColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :bets, :point, :points
  end
end
