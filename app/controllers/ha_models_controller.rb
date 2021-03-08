class HaModelsController < ApplicationController
  before_action :set_ha_model, only: %i[ show edit update destroy ]

  # GET /ha_models or /ha_models.json
  def index
    @ha_models = HaModel.all
  end

  # GET /ha_models/1 or /ha_models/1.json
  def show
  end

  # GET /ha_models/new
  def new
    @ha_model = HaModel.new
  end

  # GET /ha_models/1/edit
  def edit
  end

  # POST /ha_models or /ha_models.json
  def create
    @ha_model = HaModel.new(ha_model_params)

    respond_to do |format|
      if @ha_model.save
        format.html { redirect_to @ha_model, notice: "Ha model was successfully created." }
        format.json { render :show, status: :created, location: @ha_model }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ha_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ha_models/1 or /ha_models/1.json
  def update
    respond_to do |format|
      if @ha_model.update(ha_model_params)
        format.html { redirect_to @ha_model, notice: "Ha model was successfully updated." }
        format.json { render :show, status: :ok, location: @ha_model }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ha_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ha_models/1 or /ha_models/1.json
  def destroy
    @ha_model.destroy
    respond_to do |format|
      format.html { redirect_to ha_models_url, notice: "Ha model was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ha_model
      @ha_model = HaModel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ha_model_params
      params.require(:ha_model).permit(:name, :value)
    end
end
