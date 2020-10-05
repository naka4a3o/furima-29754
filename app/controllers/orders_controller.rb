class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: :edit
  def index
    @order = UserOrder.new
    @item = Item.find(params[:item_id])
    # @orders = @item.orders.includes(:user)
  end

  def create
    @order = UserOrder.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      Payjp.api_key = "sk_test_3ce1ae63516885802ee8c08a" 
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],  
        currency: 'jpy'               
      )
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :item_prefecture_id, :city, :house_number, :building_name, :phone_number, :token).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def move_to_show
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end
end
