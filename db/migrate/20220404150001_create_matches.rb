class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :round, null: false
      t.date :match_date
      t.references :home_team, foreign_key: { to_table: 'teams' }
      t.references :away_team, foreign_key: { to_table: 'teams' }

      t.timestamps
    end
  end
end
