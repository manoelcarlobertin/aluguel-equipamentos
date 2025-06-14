class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_customer, only: %i[show edit update destroy]

  def index
    @customers = Customer.order(:name)
    authorize Customer
  end

  def search
    @customers = Customer.where("lower(name) ILIKE ?", "%#{params[:q]}%".downcase)

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
    @customer = Customer.new customer_params
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

    if @customer.update customer_params
      redirect_to customer_params, notice: "Cliente atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @customer
  end

  private

  def authenticate_user!
    redirect_to login_path, alert: "Faça login para continuar" unless current_user
  end

  def customer_params
    params.require(:customer).permit(:name, :dob, :mobile_phone, :email)
  end

  def load_customer
    @customer = Customer.find params[:id]
  end
end
