class AddColumnsTeamHomeAndTeamAwayToMatchesTable < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :team_home, :integer
    add_column :matches, :team_away, :integer
  end
end
