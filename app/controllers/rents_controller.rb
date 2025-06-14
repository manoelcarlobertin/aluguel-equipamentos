class RentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_equipament

  def new
    @rent = Rent.new
  end

  def create
    @rent = current_user.rents.build(rent_params)
    @rent.equipament = @equipament

    if @rent.save
      redirect_to equipaments_path, notice: "Equipamento alugado com sucesso!"
    else
      render :new
    end
  end

  private

  def set_equipament
    @equipament = Equipament.find(params[:equipament_id])
  end

  def rent_params
    params.require(:rent).permit(:started_at, :finished_at)
  end
end
