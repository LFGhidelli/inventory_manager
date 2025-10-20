class InflowsController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:query].present?
      @pagy, @inflows = pagy(Inflow.where("name ILIKE ?", "%#{params[:query]}%"))
    else
      @pagy, @inflows = pagy(Inflow.all.order(created_at: :desc), limit: 5)
    end
  end

  def show
    @inflow = Inflow.find(params[:id])
  end

  def new
    @inflow = Inflow.new
  end

  def create
    @inflow = Inflow.new(inflow_params)
    @inflow.save!

    if @inflow.persisted?
      Product.find(@inflow.product_id).increment!(:quantity, @inflow.quantity)
      flash[:notice] = "Entrada criada com sucesso"
      redirect_to categories_path
    else
      flash[:alert] = "Algo deu errado"
      redirect_to categories_path
    end
  end

  private

  def inflow_params
    params.expect(inflow: [ :supplier_id, :product_id, :quantity, :description ])
  end
end
