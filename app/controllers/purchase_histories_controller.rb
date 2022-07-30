class PurchaseHistoriesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
   @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :municipality, :address, :building_name,
                                           :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end
