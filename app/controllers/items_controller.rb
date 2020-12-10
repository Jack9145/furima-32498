class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :shipping_fee_id, :shipping_date_id, :prefecture_id, :status_id, :image).merge(user_id: current_user.id)
  end
end
