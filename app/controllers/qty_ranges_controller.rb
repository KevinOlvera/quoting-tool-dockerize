class QtyRangesController < ApplicationController
  before_action :set_qty_range, only: %i[ show edit update destroy ]

  # GET /qty_ranges or /qty_ranges.json
  def index
    @qty_ranges = QtyRange.all
  end

  # GET /qty_ranges/1 or /qty_ranges/1.json
  def show
  end

  # GET /qty_ranges/new
  def new
    @qty_range = QtyRange.new
  end

  # GET /qty_ranges/1/edit
  def edit
  end

  # POST /qty_ranges or /qty_ranges.json
  def create
    @qty_range = QtyRange.new(qty_range_params)

    respond_to do |format|
      if @qty_range.save
        format.html { redirect_to @qty_range, notice: "Qty range was successfully created." }
        format.json { render :show, status: :created, location: @qty_range }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @qty_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qty_ranges/1 or /qty_ranges/1.json
  def update
    respond_to do |format|
      if @qty_range.update(qty_range_params)
        format.html { redirect_to @qty_range, notice: "Qty range was successfully updated." }
        format.json { render :show, status: :ok, location: @qty_range }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @qty_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qty_ranges/1 or /qty_ranges/1.json
  def destroy
    @qty_range.destroy
    respond_to do |format|
      format.html { redirect_to qty_ranges_url, notice: "Qty range was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qty_range
      @qty_range = QtyRange.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def qty_range_params
      params.require(:qty_range).permit(:name, :value)
    end
end
