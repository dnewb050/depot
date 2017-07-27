class FulfillmentsController < ApplicationController
  before_action :set_fulfillment, only: [:show, :edit, :update, :destroy]
  before_action :set_order, only: [:create, :new, :update, :edit]

  # GET /fulfillments
  # GET /fulfillments.json
  def index
    @fulfillments = Fulfillment.all
  end

  # GET /fulfillments/1
  # GET /fulfillments/1.json
  def show
    @fulfillment = Fulfillment.find(params[:id])
  end

  # GET /fulfillments/new
  def new
    @fulfillment = @order.fulfillments.new
  end

  # GET /fulfillments/1/edit
  def edit
  end

  # POST orders/1/fulfillments CHANGED
  # POST orders/1//fulfillments.json CHANGED
  def create
    @order = Order.find(params[:order_id])
    @fulfillment = @order.fulfillments.new(fulfillment_params)

    respond_to do |format|
      if @fulfillment.save
        format.html { redirect_to order_fulfillments_path(order_id: params[:order_id]), notice: 'Fulfillment was successfully created.' }
        format.json { render :show, status: :created, location: @fulfillment }
      else
        format.html { render :new }
        format.json { render json: @fulfillment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fulfillments/1
  # PATCH/PUT /fulfillments/1.json
  def update

    respond_to do |format|
      if @fulfillment.update(fulfillment_params)
        format.html { redirect_to order_fulfillments_path(order_id: params[:order_id]), notice: 'Fulfillment was successfully updated.' }
        format.json { render :show, status: :ok, location: @fulfillment }
      else
        format.html { render :edit }
        format.json { render json: @fulfillment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fulfillments/1
  # DELETE /fulfillments/1.json
  def destroy
    @fulfillment.destroy
    respond_to do |format|
      format.html { redirect_to fulfillments_url, notice: 'Fulfillment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fulfillment
      @fulfillment = Fulfillment.find(params[:id])
    end

    def set_order
      @order = Order.find(params[:order_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fulfillment_params
      params.require(:fulfillment).permit(:ship_type, :order, :carrier, :tracking_number)
    end
end
