class EquipamentsController < ApplicationController
  before_action :set_equipament, only: %i[ show edit update destroy ]

  # validações
  def available
    begin
      period_start = params[:filter] && params[:filter][:period_start].present? ? Date.parse(params[:filter][:period_start]) : Date.today
      period_end = params[:filter] && params[:filter][:period_end].present? ? Date.parse(params[:filter][:period_end]) : Date.today + 7.days

      if period_end < period_start
        flash.now[:alert] = "Data fim não pode ser anterior à data início."
        @equipaments = Equipament.none
      else
        @equipaments = Equipament.availables(period_start, period_end)
      end
    rescue ArgumentError
      flash.now[:alert] = "Datas inválidas. Por favor, insira datas no formato correto."
      @equipaments = Equipament.none
    end
  end

  # def available
  #   period_start = params[:period_start].present? ? Date.parse(params[:period_start]) : Date.today - 7.days
  #   period_end = params[:period_end].present? ? Date.parse(params[:period_end]) : Date.today + 2.days

  #   @equipaments = Equipament.availables(period_start, period_end)
  # end

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
