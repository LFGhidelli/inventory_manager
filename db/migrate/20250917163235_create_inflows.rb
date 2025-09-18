class CreateInflows < ActiveRecord::Migration[8.0]
  def change
    create_table :inflows do |t|
      t.integer :quantity
      t.text :description
      t.references :supplier, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
