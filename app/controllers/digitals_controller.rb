class DigitalsController < ApplicationController
  before_action :set_digital, only: %i[ show edit update destroy ]

  # GET /digitals or /digitals.json
  def index
    @digitals = Digital.all
  end

  # GET /digitals/1 or /digitals/1.json
  def show
  end

  # GET /digitals/new
  def new
    @digital = Digital.new
  end

  # GET /digitals/1/edit
  def edit
  end

  # POST /digitals or /digitals.json
  def create
    @digital = Digital.new(digital_params)

    respond_to do |format|
      if @digital.save
        format.html { redirect_to @digital, notice: "Digital was successfully created." }
        format.json { render :show, status: :created, location: @digital }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @digital.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /digitals/1 or /digitals/1.json
  def update
    respond_to do |format|
      if @digital.update(digital_params)
        format.html { redirect_to @digital, notice: "Digital was successfully updated." }
        format.json { render :show, status: :ok, location: @digital }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @digital.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /digitals/1 or /digitals/1.json
  def destroy
    @digital.destroy
    respond_to do |format|
      format.html { redirect_to digitals_url, notice: "Digital was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_digital
      @digital = Digital.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def digital_params
      params.require(:digital).permit(:name, :stock, :price, :sku)
    end
end
