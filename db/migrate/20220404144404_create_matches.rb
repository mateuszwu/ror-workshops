class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.belongs_to :round, null: false
      t.belongs_to :home_team, null: false, foreign_key: { to_table: :teams }
      t.belongs_to :away_team, null: false, foreign_key: { to_table: :teams }
      t.timestamps
    end
  end
end
