class Brand < ApplicationRecord
  has_many :products, dependent: :nullify

  def self.products_by_brand
    all.map { |brand| [ brand.name, brand.products.count ] }.to_h
  end
end
