class CloudManagementSystemsController < ApplicationController
  before_action :set_cloud_management_system, only: %i[ show edit update destroy ]

  # GET /cloud_management_systems or /cloud_management_systems.json
  def index
    @cloud_management_systems = CloudManagementSystem.all
  end

  # GET /cloud_management_systems/1 or /cloud_management_systems/1.json
  def show
  end

  # GET /cloud_management_systems/new
  def new
    @cloud_management_system = CloudManagementSystem.new
  end

  # GET /cloud_management_systems/1/edit
  def edit
  end

  # POST /cloud_management_systems or /cloud_management_systems.json
  def create
    @cloud_management_system = CloudManagementSystem.new(cloud_management_system_params)

    respond_to do |format|
      if @cloud_management_system.save
        format.html { redirect_to @cloud_management_system, notice: "Cloud management system was successfully created." }
        format.json { render :show, status: :created, location: @cloud_management_system }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cloud_management_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cloud_management_systems/1 or /cloud_management_systems/1.json
  def update
    respond_to do |format|
      if @cloud_management_system.update(cloud_management_system_params)
        format.html { redirect_to @cloud_management_system, notice: "Cloud management system was successfully updated." }
        format.json { render :show, status: :ok, location: @cloud_management_system }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cloud_management_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cloud_management_systems/1 or /cloud_management_systems/1.json
  def destroy
    @cloud_management_system.destroy
    respond_to do |format|
      format.html { redirect_to cloud_management_systems_url, notice: "Cloud management system was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cloud_management_system
      @cloud_management_system = CloudManagementSystem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cloud_management_system_params
      params.require(:cloud_management_system).permit(:name, :value)
    end
end
