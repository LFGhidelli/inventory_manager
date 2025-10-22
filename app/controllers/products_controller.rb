class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @pagy, @products = pagy(Product.all.filtered(params))
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product

    @product.save

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
    authorize @product
  end

  def update
    @product = Product.find(params[:id])
    authorize @product

    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end
  def destroy
    @product = Product.find(params[:id])
    authorize @product

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
