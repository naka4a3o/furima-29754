class ItemsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index 
    end

    def item_params
      params.require(:item).permit(:name, :description, :category_id, :item_status_id, :price,:shipping_bearer_id, :item_prefecture_id,:scheduled_delivery_id, :image ).merge(user_id: current_user.id)
    end
  end
end
