class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :player_name
      t.date :player_date_of_birth, default: -> { 'CURRENT_YEAR' }
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
