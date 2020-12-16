class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :user_confirmation, only: [:index, :create]
  before_action :sold_item, only: [:index, :create]
  def index
    @form = PurchaseForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @form = PurchaseForm.new(purchase_params)
    if @form.valid?
      pay_item
      @form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(:card_type, :expire_month, :expire_year, :security_code, :postal_code, :prefecture_id, :city, :address, :phone_number, :building).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(purchase_params[:item_id]).price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def user_confirmation
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id === @item.user_id
  end

  def sold_item
    redirect_to root_path if Purchase.find_by(item_id: @item.id)
  end

end
