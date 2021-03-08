class HourlyCostsController < ApplicationController
  before_action :set_hourly_cost, only: %i[ show edit update destroy ]

  # GET /hourly_costs or /hourly_costs.json
  def index
    @hourly_costs = HourlyCost.all
  end

  # GET /hourly_costs/1 or /hourly_costs/1.json
  def show
  end

  # GET /hourly_costs/new
  def new
    @hourly_cost = HourlyCost.new
  end

  # GET /hourly_costs/1/edit
  def edit
  end

  # POST /hourly_costs or /hourly_costs.json
  def create
    @hourly_cost = HourlyCost.new(hourly_cost_params)

    respond_to do |format|
      if @hourly_cost.save
        format.html { redirect_to @hourly_cost, notice: "Hourly cost was successfully created." }
        format.json { render :show, status: :created, location: @hourly_cost }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hourly_cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hourly_costs/1 or /hourly_costs/1.json
  def update
    respond_to do |format|
      if @hourly_cost.update(hourly_cost_params)
        format.html { redirect_to @hourly_cost, notice: "Hourly cost was successfully updated." }
        format.json { render :show, status: :ok, location: @hourly_cost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hourly_cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hourly_costs/1 or /hourly_costs/1.json
  def destroy
    @hourly_cost.destroy
    respond_to do |format|
      format.html { redirect_to hourly_costs_url, notice: "Hourly cost was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hourly_cost
      @hourly_cost = HourlyCost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hourly_cost_params
      params.require(:hourly_cost).permit(:lead_architect, :design_engineer, :network_integration, :technical_project_manager)
    end
end
