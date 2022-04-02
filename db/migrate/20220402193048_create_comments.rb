class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.string :commenter
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
