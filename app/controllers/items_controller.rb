class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :find_params, only: [:show, :edit, :update]
  before_action :edit_confirmation, only: :edit

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
    @item.update(item_params)

    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :shipping_fee_id, :shipping_date_id, :prefecture_id, :status_id, :image).merge(user_id: current_user.id)
  end

  def find_params
    @item = Item.find(params[:id])
  end

  def edit_confirmation
    if !user_signed_in?
      redirect_to new_user_session_path
    elsif current_user.id === @item.user_id
    else
      redirect_to root_path
    end
  end
end
