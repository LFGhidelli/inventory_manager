class ProductsController < ApplicationController
  def index
    if params[:query].present?
      @pagy, @products = pagy(Product.where("title ILIKE ?", "%#{params[:query]}%"))
    else
      @pagy, @products = pagy(Product.all.order(created_at: :desc), limit: 5)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save!
    debugger

    if @product.persisted?
      flash[:notice] = "Categoria criada com sucesso"
      redirect_to products_path
    else
      flash[:alert] = "Algo deu errado"
      redirect_to products_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end
  def destroy
    @product = Product.find(params[:id])

    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.expect(product:
      [ :title,
        :description,
        :serie_number,
        :cost_price,
        :selling_price,
        :quantity,
        :brand_id,
        :category_id
      ])
  end
end
