class SuppliersController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:query].present?
      @pagy, @suppliers = pagy(Supplier.where("name ILIKE ?", "%#{params[:query]}%"))
    else
      @pagy, @suppliers = pagy(Supplier.all.order(created_at: :desc), limit: 5)
    end
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    authorize @supplier

    @supplier.save!

    if @supplier.persisted?
      flash[:notice] = "Fornecedor criado com sucesso"
      redirect_to suppliers_path
    else
      flash[:alert] = "Algo deu errado"
      redirect_to suppliers_path
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
    authorize @supplier
  end

  def update
    @supplier = Supplier.find(params[:id])
    authorize @supplier

    if @supplier.update(supplier_params)
      redirect_to suppliers_path
    else
      render :edit
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    authorize @supplier

    @supplier.destroy
    redirect_to suppliers_path
  end

  private

  def supplier_params
    params.expect(supplier: [ :name, :description ])
  end
end
