class CheckOutsController < ApplicationController
  before_action :set_check_out, only: [:show, :edit, :close, :destroy, :scan]

  # GET /check_outs
  # GET /check_outs.json
  def index
    @check_outs = CheckOut.all
  end

  # GET /check_outs/1
  # GET /check_outs/1.json
  def show
  end

  # GET /check_outs/new
  def new
    @check_out = CheckOut.new
  end

  # GET /check_outs/1/edit
  def edit
  end

  def scan
    respond_to do |format|
      if @check_out.scan(params[:scan])
        format.html { redirect_to "/check_outs/#{@check_out.id}/edit", notice: "Scan successful." }
        format.json { render json: @check_out.errors, status: :unprocessable_entity }
      else
        format.html { redirect_to "/check_outs/#{@check_out.id}/edit", id: @check_out.id,notice: "Product code invalid." }
        format.json { render json: @check_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /check_outs
  # POST /check_outs.json
  def close
    @check_out.close
    respond_to do |format|
      if @check_out.save
        format.html { redirect_to @check_out, notice: 'Check out was successfully closed.' }
        format.json { render :show, status: :created, location: @check_out }
      else
        format.html { render :edit }
        format.json { render json: @check_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /check_outs/1
  # DELETE /check_outs/1.json
  def destroy
    @check_out.check_out_products.each {|cop| cop.destroy}
    @check_out.destroy
    respond_to do |format|
      format.html { redirect_to check_outs_url, notice: 'Check out was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check_out
      @check_out = CheckOut.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_out_params
      params.require(:check_out).permit(:date_started, :date_closed)
    end
end
