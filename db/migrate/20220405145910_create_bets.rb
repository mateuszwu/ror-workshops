class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.references :match, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :home_team_score, default: 0, null: false
      t.integer :away_team_score, default: 0, null: false

      t.timestamps
    end
  end
end
