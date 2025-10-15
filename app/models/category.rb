class Category < ApplicationRecord
  has_many :products

  def self.product_by_category
    self.all.map { |cat| [ cat.name, cat.products.count || 0 ] }.to_h
  end
end
