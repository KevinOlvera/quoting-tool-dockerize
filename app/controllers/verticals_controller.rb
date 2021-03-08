class VerticalsController < ApplicationController
  before_action :set_vertical, only: %i[ show edit update destroy ]

  # GET /verticals or /verticals.json
  def index
    @verticals = Vertical.all
  end

  # GET /verticals/1 or /verticals/1.json
  def show
  end

  # GET /verticals/new
  def new
    @vertical = Vertical.new
  end

  # GET /verticals/1/edit
  def edit
  end

  # POST /verticals or /verticals.json
  def create
    @vertical = Vertical.new(vertical_params)

    respond_to do |format|
      if @vertical.save
        format.html { redirect_to @vertical, notice: "Vertical was successfully created." }
        format.json { render :show, status: :created, location: @vertical }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vertical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /verticals/1 or /verticals/1.json
  def update
    respond_to do |format|
      if @vertical.update(vertical_params)
        format.html { redirect_to @vertical, notice: "Vertical was successfully updated." }
        format.json { render :show, status: :ok, location: @vertical }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vertical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /verticals/1 or /verticals/1.json
  def destroy
    @vertical.destroy
    respond_to do |format|
      format.html { redirect_to verticals_url, notice: "Vertical was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vertical
      @vertical = Vertical.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vertical_params
      params.require(:vertical).permit(:name, :value)
    end
end
