class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: %i[show edit update destroy]

  # Pundit callbacks to ensure authorization is performed
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def index
    @customers = policy_scope(Customer).ordered
  end

  def search
    query = params[:q].to_s.strip.downcase
    @customers = policy_scope(Customer).search_by_name(query)
    render layout: false
  end

  def show
  end

  def new
    @customer = Customer.new
    authorize @customer
  end

  def create
    @customer = Customer.new(customer_params)
    authorize @customer

    if @customer.save
      redirect_to customers_path, notice: t('customers.notices.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: t('customers.notices.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path, notice: t('customers.notices.destroyed')
  end

  private

  def set_customer
    @customer = policy_scope(Customer).find(params[:id])
    authorize @customer
  end

  def customer_params
    params.require(:customer).permit(:name, :dob, :mobile_phone, :email)
  end
end
