class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.integer :match_id, index: true, foreign_key: { to_table: :matches }
      t.integer :user_id, index: true, foreign_key: { to_table: :users }
      t.integer :home_team_score, null: false
      t.integer :away_team_score, null: false
      t.integer :point, index: true, default: 0

      t.timestamps
    end
  end
end
