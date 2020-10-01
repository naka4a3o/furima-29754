class ItemsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params) 

    if @item.valid?
      @item.save
      redirect_to root_path
    else
      #@items = Item.includes(:user)
      render :new
    end
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?

    def item_params
      params.require(:item).permit(:name, :description, :category_id, :item_status_id, :price, :shipping_bearer_id, :item_prefecture_id, :scheduled_delivery_id, :image).merge(user_id: current_user.id)
    end
  end
end
