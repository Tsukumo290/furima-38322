class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find

  def index
    @item = Item.find(params[:item_id])
    @purchase_history_order = PurchaseHistoryOrder.new
    redirect_to root_path if @item.purchase_history.present? or @item.user.id == current_user.id
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_history_order = PurchaseHistoryOrder.new(purchase_history_order_params)
    if @purchase_history_order.valid?
      pay_item
      @purchase_history_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_history_order_params[:token],
      currency: 'jpy'
    )
  end

  def purchase_history_order_params
    params.require(:purchase_history_order).permit(:post_code, :prefecture_id, :municipality, :address, :building_name,
                                                   :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
end
