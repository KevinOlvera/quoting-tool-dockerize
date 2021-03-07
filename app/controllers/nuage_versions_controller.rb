class NuageVersionsController < ApplicationController
  before_action :set_nuage_version, only: %i[ show edit update destroy ]

  # GET /nuage_versions or /nuage_versions.json
  def index
    @nuage_versions = NuageVersion.all
  end

  # GET /nuage_versions/1 or /nuage_versions/1.json
  def show
  end

  # GET /nuage_versions/new
  def new
    @nuage_version = NuageVersion.new
  end

  # GET /nuage_versions/1/edit
  def edit
  end

  # POST /nuage_versions or /nuage_versions.json
  def create
    @nuage_version = NuageVersion.new(nuage_version_params)

    respond_to do |format|
      if @nuage_version.save
        format.html { redirect_to @nuage_version, notice: "Nuage version was successfully created." }
        format.json { render :show, status: :created, location: @nuage_version }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nuage_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nuage_versions/1 or /nuage_versions/1.json
  def update
    respond_to do |format|
      if @nuage_version.update(nuage_version_params)
        format.html { redirect_to @nuage_version, notice: "Nuage version was successfully updated." }
        format.json { render :show, status: :ok, location: @nuage_version }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nuage_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nuage_versions/1 or /nuage_versions/1.json
  def destroy
    @nuage_version.destroy
    respond_to do |format|
      format.html { redirect_to nuage_versions_url, notice: "Nuage version was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nuage_version
      @nuage_version = NuageVersion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nuage_version_params
      params.require(:nuage_version).permit(:name, :value)
    end
end
