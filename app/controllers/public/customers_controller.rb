class Public::CustomersController < ApplicationController
  def show
    @customers = Customer.all
  end

  def edit
    @customer = Customer.all
  end

  def update
    @customer = Customer.all
    @customer.update(customer_params)
    redirect_to customers_mypage_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end
end
