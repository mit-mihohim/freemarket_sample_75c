class PurchasesController < ApplicationController
  require "payjp"
  before_action :set_card, :set_item, :authenticate_buyer

  def buy
    if @card.blank?
      redirect_to new_payment_card_path
    else
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(@card.payjp_customer_id)
      # PAY.JPの顧客情報から、デフォルトで使うクレジットカードを取得する。
      @card_info = customer.cards.retrieve(customer.default_card)
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3)
      @address = current_user.address
      @item_image = ItemImage.where(item_id: @item.id).first
    end
  end

  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    Payjp::Charge.create(
      :amount => @item.price,
      :customer => @card.payjp_customer_id,
      :currency => "jpy"
    )
    @item.update(buyer_id: current_user.id)
    redirect_to root_path, notice: '支払いが完了しました' 
  end


  private

  def set_card
    #カード情報
    @card = PaymentCard.where(user_id: current_user).first
  end

  def set_item
    #購入品の情報
    @item = Item.find(params[:item_id])
  end

  def authenticate_buyer
    #購入者が出品者ではないか確認
    if @item.seller_id == current_user.id
      redirect_to root_path, notice: '出品者は購入できません'
    end
  end
end
