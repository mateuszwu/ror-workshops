class CreateTeam < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :string

      t.timestamps
    end
  end
end
