  def set_product
    @product = Product.find(@outflow.product_id)
  end
