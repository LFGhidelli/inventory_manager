class Brand < ApplicationRecord
  has_many :products, dependent: :nullify

  before_create :set_description_if_blank

  def self.products_by_brand
    all.map { |brand| [ brand.name, brand.products.count ] }.to_h
  end

  def set_description_if_blank
    if self.description.blank?
      self.description = Ai::BrandDescription.generate(self.name)
    end
  end
end
