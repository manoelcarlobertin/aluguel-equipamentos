class CustomersController < ApplicationController
  before_action :authenticate_user!           # Usa Devise para autenticação
  before_action :set_customer, only: %i[show edit update destroy]

  def index
    @customers = Customer.order(:name)
    authorize Customer
  end

  def search
    query = params[:q].to_s.downcase
    @customers = Customer.where("LOWER(name) LIKE ?", "%#{query}%")
    render layout: false
  end

  def show
    authorize @customer
  end

  def new
    @customer = Customer.new
    authorize @customer
  end

  def create
    @customer = Customer.new(customer_params)
    authorize @customer

    if @customer.save
      redirect_to customers_path, notice: "Cliente cadastrado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @customer
  end

  def update
    authorize @customer

    if @customer.update(customer_params)
      redirect_to customer_path(@customer), notice: "Cliente atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @customer
    @customer.destroy
    redirect_to customers_path, notice: "Cliente removido com sucesso."
  end

  private

  # Usar nome padrão 'set_customer' para callbacks é mais comum
  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :dob, :mobile_phone, :email)
  end
end
