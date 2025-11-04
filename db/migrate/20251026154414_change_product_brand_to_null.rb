class ChangeProductBrandToNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null :products, :brand_id, true
  end
end
