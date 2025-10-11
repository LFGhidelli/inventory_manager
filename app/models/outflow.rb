class Outflow < ApplicationRecord
  belongs_to :product
  validate :enough_stock?

  def enough_stock?
    if quantity.present? && product.present? && quantity > product.quantity
      errors.add(:quantity, "não pode ser maior que o estoque disponível")
    end
  end

  def self.total_sales
    all.count
  end

  def self.total_items_sold
    all.sum(:quantity)
  end

  def self.amount_sold
    all.sum { |o| o.quantity * o.product.selling_price }
  end

  def self.profit
    amount_sold - all.sum { |o| o.quantity * o.product.cost_price }
  end

  def self.daily_sales_data
    raw_data = Outflow.where("created_at >= ?", 10.days.ago)
                      .group("DATE(created_at)")
                      .order("DATE(created_at)")
                      .sum(:quantity)

    (10.days.ago.to_date..Date.today).map { |d| [ d.to_s, raw_data[d] || 0 ] }.to_h
  end
end
