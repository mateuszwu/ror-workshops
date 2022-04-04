class AddDateOfMatchToMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :match_date, :date, null: false
    add_column :matches, :id_team_home, :integer, null: false
    add_column :matches, :id_team_away, :integer, null: false
  end
end
