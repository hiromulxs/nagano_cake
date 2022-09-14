class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    order = current_customer.order.new(order_params)
    cart_items = current_customer.cart_items
    order.save
    cart_items.each do |cart_item|
      order_item = OrderItem.new
      order_item.order_id = order.id
      order_item.item_id = cart_item.item_id
      order_item.purchase_price = cart_item.item.price
      order_item.quantity = cart_item.amount
      order_item.save
    end
    cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_number] == "0"
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_name = current_customer.last_name + current_customer.first_name
      @order.shipping_address = current_customer.address
    elsif params[:order][:address_number] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.shipping_postal_code = @address.postal_code
      @order.shipping_address = @address.address
      @order.shipping_name = @address.name
    elsif params[:order][:address_number] == "2"
      # address_new = current_customer.addresses.new
      @order.save
    end
  @cart_items = current_customer.cart_items.all
  end

  def index
    @orders = current_customer.order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:pay_type, :shipping_name, :shipping_address, :shipping_postal_code, :billing_amount)
  end

end
