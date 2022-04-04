class CreateMatch < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.belongs_to :round, null:false
      t.belongs_to :team_home, null:false, foreign_key: { to_table: :teams }
      t.belongs_to :team_away, null:false, foreign_key: { to_table: :teams }

      t.timestamps
    end
  end
end
