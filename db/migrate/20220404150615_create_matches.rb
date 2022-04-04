class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.belongs_to :round, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
