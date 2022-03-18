class CreateMatch < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :home_team, null: false, foreign_key: { to_table: :teams }
      t.references :away_team, null: false, foreign_key: { to_table: :teams }
      t.integer :away_team_score
      t.integer :home_team_score
      t.references :round, null: false, foreign_key: true
      t.date :match_date

      t.timestamps
    end
  end
end
