class Outflow < ApplicationRecord
  belongs_to :product
  validate :enough_stock?

  def enough_stock?
    if quantity.present? && product.present? && quantity > product.quantity
      errors.add(:quantity, "não pode ser maior que o estoque disponível")
    end
  end
end
