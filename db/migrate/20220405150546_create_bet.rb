class CreateBet < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.integer :home_team_score
      t.integer :away_team_score
      t.references :match, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
