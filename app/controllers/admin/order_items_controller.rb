class Admin::OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:order_item][:order_item_id]) #いまいち理解不足質問して確認する
    @order_item.update(order_item_params)
    redirect_to admin_order_path(@order_item.order.id)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
end
