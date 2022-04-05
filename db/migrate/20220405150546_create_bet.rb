class CreateBet < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.string :home_team_score
      t.string :home_team_score
      t.references :round, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
