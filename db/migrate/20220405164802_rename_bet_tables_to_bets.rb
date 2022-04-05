class RenameBetTablesToBets < ActiveRecord::Migration[7.0]
  def change
    rename_table :bet_tables, :bets
  end
end
