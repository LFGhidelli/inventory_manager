class CreateOutflows < ActiveRecord::Migration[8.0]
  def change
    create_table :outflows do |t|
      t.integer :quantity
      t.text :description
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
