class CheckOutProductsController < ApplicationController
  before_action :set_check_out_product, only: [:show, :edit, :update, :destroy]

  # GET /check_out_products
  # GET /check_out_products.json
  def index
    @check_out_products = CheckOutProduct.all
  end

  # GET /check_out_products/1
  # GET /check_out_products/1.json
  def show
  end

  # GET /check_out_products/new
  def new
    @check_out_product = CheckOutProduct.new
  end

  # GET /check_out_products/1/edit
  def edit
  end

  # POST /check_out_products
  # POST /check_out_products.json
  def create
    @check_out_product = CheckOutProduct.new(check_out_product_params)

    respond_to do |format|
      if @check_out_product.save
        format.html { redirect_to @check_out_product, notice: 'Check out product was successfully created.' }
        format.json { render :show, status: :created, location: @check_out_product }
      else
        format.html { render :new }
        format.json { render json: @check_out_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /check_out_products/1
  # PATCH/PUT /check_out_products/1.json
  def update
    respond_to do |format|
      if @check_out_product.update(check_out_product_params)
        format.html { redirect_to @check_out_product, notice: 'Check out product was successfully updated.' }
        format.json { render :show, status: :ok, location: @check_out_product }
      else
        format.html { render :edit }
        format.json { render json: @check_out_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /check_out_products/1
  # DELETE /check_out_products/1.json
  def destroy
    @check_out_product.destroy
    respond_to do |format|
      format.html { redirect_to check_out_products_url, notice: 'Check out product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check_out_product
      @check_out_product = CheckOutProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_out_product_params
      params.require(:check_out_product).permit(:product_id, :check_out_id, :date_added)
    end
end
