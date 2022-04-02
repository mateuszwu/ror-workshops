class CreateRounds < ActiveRecord::Migration[7.0]
  def change
    create_table :rounds do |t|
      t.integer :year
      t.integer :number
      t.timestamps
    end
  end
end
