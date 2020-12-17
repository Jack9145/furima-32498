class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :find_params, only: [:show, :edit, :update, :destroy]
  before_action :user_confirmation, only: [:edit, :update, :destroy]
  before_action :sold_item, only: :edit

  def index
    @item = Item.all.order('created_at DESC')
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :shipping_fee_id, :shipping_date_id, :prefecture_id, :status_id, :image).merge(user_id: current_user.id)
  end

  def find_params
    @item = Item.find(params[:id])
  end

  def user_confirmation
    redirect_to root_path unless current_user.id === @item.user_id
  end

  def sold_item
    redirect_to root_path if @item.purchase
  end
end
