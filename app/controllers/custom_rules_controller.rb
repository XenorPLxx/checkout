class CustomRulesController < ApplicationController
  before_action :set_custom_rule, only: [:show, :edit, :update, :destroy]

  # GET /custom_rules
  # GET /custom_rules.json
  def index
    @custom_rules = CustomRule.all
  end

  # GET /custom_rules/1
  # GET /custom_rules/1.json
  def show
  end

  # GET /custom_rules/new
  def new
    @custom_rule = CustomRule.new
  end

  # GET /custom_rules/1/edit
  def edit
  end

  # POST /custom_rules
  # POST /custom_rules.json
  def create
    @custom_rule = CustomRule.new(custom_rule_params)

    respond_to do |format|
      if @custom_rule.save
        format.html { redirect_to @custom_rule, notice: 'Custom rule was successfully created.' }
        format.json { render :show, status: :created, location: @custom_rule }
      else
        format.html { render :new }
        format.json { render json: @custom_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_rules/1
  # PATCH/PUT /custom_rules/1.json
  def update
    respond_to do |format|
      if @custom_rule.update(custom_rule_params)
        format.html { redirect_to @custom_rule, notice: 'Custom rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @custom_rule }
      else
        format.html { render :edit }
        format.json { render json: @custom_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_rules/1
  # DELETE /custom_rules/1.json
  def destroy
    @custom_rule.destroy
    respond_to do |format|
      format.html { redirect_to custom_rules_url, notice: 'Custom rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_rule
      @custom_rule = CustomRule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_rule_params
      params.require(:custom_rule).permit(:product_id, :rule, :date_from, :date_to)
    end
end
