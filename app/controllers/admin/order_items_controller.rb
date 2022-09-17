class Admin::OrderItemsController < ApplicationController
  def update
    # @order_item = OrderItem.find(params[:order_item][:order_item_id])
    @order_item = OrderItem.find(params[:id])  #hidden_fieldを使用した場合の記述と結果は同じになる
    @order_item.update(order_item_params)
    redirect_to admin_order_path(@order_item.order.id)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
end
