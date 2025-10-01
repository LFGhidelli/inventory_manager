class CategoriesController < ApplicationController
  def index
    if params[:query].present?
      @pagy, @categories = pagy(Category.where("name ILIKE ?", "%#{params[:query]}%"))
    else
      @pagy, @categories = pagy(Category.all.order(created_at: :desc), limit: 5)
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save!

    if @category.persisted?
      flash[:notice] = "Categoria criada com sucesso"
      redirect_to categories_path
    else
      flash[:alert] = "Algo deu errado"
      redirect_to categories_path
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
  
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end
  def destroy
    @category = Category.find(params[:id])

    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.expect(category: [ :name, :description ])
  end
end
