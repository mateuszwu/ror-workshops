class CreateBetTable < ActiveRecord::Migration[7.0]
  def change
    create_table :bet_tables do |t|
      t.references :user_id, null: false, foreign_key: { to_table: :users }
      t.references :round_id, null: false, foreign_key: { to_table: :rounds }
      t.integer :home_team_score
      t.integer :away_team_score

      t.timestamps
    end
  end
end
