class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.bigint :away_team_id, index: true, foreign_key: { to_table: :teams }
      t.bigint :home_team_id, index: true, foreign_key: { to_table: :teams }
      t.integer :away_team_score
      t.integer :home_team_score
      t.datetime :match_date, null: false
      t.integer  :round_id, index: true, foreign_key: { to_table: :rounds }

      t.timestamps
    end
  end
end
