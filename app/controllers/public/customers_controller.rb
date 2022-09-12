class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    current_customer.update(customer_params)
    redirect_to customers_mypage_path
  end

  def withdraw
  end

  def withdrawal
    # @customer = Customer.find(params[:id])
    @customer = current_customer
    @customer.update(is_active: true)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end
end
