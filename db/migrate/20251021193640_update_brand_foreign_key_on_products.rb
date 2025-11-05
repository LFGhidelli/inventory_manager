class UpdateBrandForeignKeyOnProducts < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :products, :brands

    add_foreign_key :products, :brands, on_delete: :nullify
  end
end
