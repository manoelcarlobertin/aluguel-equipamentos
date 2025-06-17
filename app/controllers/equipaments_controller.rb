class EquipamentsController < ApplicationController
  before_action :set_equipament, only: %i[ show edit update destroy ]

  def index
    @equipaments = Equipament.all
  end

  def show;end

  def new
    @equipament = Equipament.new
  end

  def edit;end

  def create
    @equipament = Equipament.new(equipament_params)

    if @equipament.save
      redirect_to @equipament, notice: "Equipament was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @equipament.update(equipament_params)
      redirect_to @equipament, notice: "Equipament was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @equipament.destroy!

    redirect_to equipaments_path, status: :see_other, notice: "Equipament was successfully destroyed."
  end

  private
  def set_equipament
    @equipament = Equipament.find(params.expect(:id))
  end

  def equipament_params
    params.expect(equipament: [ :name, :description, :available, :price, :per, :day ])
  end
end
