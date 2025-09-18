class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :serie_number
      t.decimal :cost_price
      t.decimal :selling_price
      t.integer :quantity
      t.references :brand, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
