class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  scope :search, ->(query) { where("title ILIKE ?", "%#{query}%") if query.present? }
  scope :by_number, ->(number) { where("serie_number ILIKE ?", "#{number}%") if number.present? }
  scope :by_brand, ->(brand_id) { where(brand_id: brand_id) if brand_id.present? }
  scope :by_category, ->(category_id) { where(category_id: category_id) if category_id.present? }

  def self.filtered(params)
    all
      .search(params[:query])
      .by_number(params[:number_query])
      .by_brand(params[:brand_query])
      .by_category(params[:category_query])
      .order(created_at: :desc)
  end

  def self.total_quantity
    Product.all.sum(:quantity)
  end

  def self.total_cost_price
    Product.all.sum(:cost_price)
  end

  def self.inventory_value
    Product.all.sum(:selling_price)
  end
end
