class PurchasesController < ApplicationController
  
  def index
    @credit_card = Creditcard.new
  end

  def create
    @credit_card = Creditcard.new(purchase_params)
    if @credit_card.valid?
       @credit_card.save
       redirect_to action: root_path
    else
      render action: :index
    end
  end

  private
  def purchase_params
    params.require(:creditcard).permit(:card_type, :expire_month, :expire_year, :security_code, :postal_code, :prefecture_id, :city, :address, :phone_number, :building)
  end

end
