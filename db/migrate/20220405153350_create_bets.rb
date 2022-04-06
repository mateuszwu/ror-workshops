class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.references :match_id, null: false, foreign_key: { to_table: :matches }
      t.references :user_id, null: false, foreign_key: { to_table: :users }
      t.integer :home_team_score
      t.integer :away_team_score

      t.timestamps
    end
  end
end
