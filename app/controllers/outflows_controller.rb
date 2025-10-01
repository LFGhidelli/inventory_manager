class OutflowsController < ApplicationController
  def index
    if params[:query].present?
      @pagy, @outflows = pagy(Outflow.where("name ILIKE ?", "%#{params[:query]}%"))
    else
      @pagy, @outflows = pagy(Outflow.all.order(created_at: :desc), limit: 5)
    end
  end

  def show
    @outflow = Outflow.find(params[:id])
  end

  def new
    @outflow = Outflow.new
  end

  def create
    @outflow = Outflow.create(outflow_params)

    if @outflow.valid?
      flash[:notice] = "Saída criada com sucesso"
      redirect_to outflows_path
    else
      flash.now[:alert] = "Algo deu errado"
      render :new, status: :unprocessable_content
    end
  end

  private

  def outflow_params
    params.expect(outflow: [ :supplier_id, :product_id, :quantity, :description ])
  end
end
