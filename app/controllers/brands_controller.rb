class BrandsController < ApplicationController
  def index
    if params[:query].present?
      @pagy, @brands = pagy(Brand.where("name ILIKE ?", "%#{params[:query]}%"))
    else
      @pagy, @brands = pagy(Brand.all.order(created_at: :desc), limit: 5)
    end
  end

  def show
    @brand = Brand.find(params[:id])
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    @brand.save!

    if @brand.persisted?
      flash[:notice] = "Marca criada com sucesso"
      redirect_to brands_path
    else
      flash[:alert] = "Algo deu errado"
      redirect_to brands_path
    end
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])

    if @brand.update(brand_params)
      redirect_to brands_path
    else
      render :edit
    end
  end
  def destroy
    @brand = Brand.find(params[:id])

    @brand.destroy
    redirect_to brands_path
  end

  private

  def brand_params
    params.expect(brand: [ :name, :description ])
  end
end
