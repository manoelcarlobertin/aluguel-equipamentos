class EquipamentsController < ApplicationController
  before_action :set_equipament, only: %i[ show edit update destroy ]

  # GET /equipaments or /equipaments.json
  def index
    @equipaments = Equipament.all
  end

  # GET /equipaments/1 or /equipaments/1.json
  def show
  end

  # GET /equipaments/new
  def new
    @equipament = Equipament.new
  end

  # GET /equipaments/1/edit
  def edit
  end

  # POST /equipaments or /equipaments.json
  def create
    @equipament = Equipament.new(equipament_params)

    respond_to do |format|
      if @equipament.save
        format.html { redirect_to @equipament, notice: "Equipament was successfully created." }
        format.json { render :show, status: :created, location: @equipament }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @equipament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipaments/1 or /equipaments/1.json
  def update
    respond_to do |format|
      if @equipament.update(equipament_params)
        format.html { redirect_to @equipament, notice: "Equipament was successfully updated." }
        format.json { render :show, status: :ok, location: @equipament }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @equipament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipaments/1 or /equipaments/1.json
  def destroy
    @equipament.destroy!

    respond_to do |format|
      format.html { redirect_to equipaments_path, status: :see_other, notice: "Equipament was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipament
      @equipament = Equipament.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def equipament_params
      params.expect(equipament: [ :name, :description, :available, :price, :per, :day ])
    end
end
