class PaymentCardsController < ApplicationController
  #PAYJPとやり取りするために、payjpをロード
  require "payjp"
  before_action :set_card

  def index
    # すでにクレジットカードが登録しているか？
    if @card.present?
      # 登録している場合,PAY.JPからカード情報を取得する
      # PAY.JPの秘密鍵をセットする。
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      # PAY.JPから顧客情報を取得する。
      customer = Payjp::Customer.retrieve(@card.payjp_customer_id)
      # PAY.JPの顧客情報から、デフォルトで使うクレジットカードを取得する。
      @card_info = customer.cards.retrieve(customer.default_card)
      # クレジットカード情報から表示させたい情報を定義する。
      # クレジットカードの画像を表示するために、カード会社を取得
      @card_brand = @card_info.brand
      # クレジットカードの有効期限を取得
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3) 

      # クレジットカード会社を取得したので、カード会社の画像をviewに表示させるため、ファイルを指定する。
      case @card_brand
      when "Visa"
        @card_image = "visa.png"
      when "JCB"
        @card_image = "jcb.png"
      when "MasterCard"
        @card_image = "master-card.png"
      when "American Express"
        @card_image = "amex.png"
      when "Diners Club"
        @card_image = "diners.png"
      when "Discover"
        @card_image = "discover.png"
      end
    end
  end

  def new
    # cardがすでに登録済みの場合、indexのページに戻します。
    @card = PaymentCard.where(user_id: current_user.id).first
    redirect_to action: "index" if @card.present?
  end

  def create
    # credentials.yml.encに記載したAPI秘密鍵を呼び出してpay.jpと通信
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]

    # フォームの値を引数に顧客を作成。
    customer = Payjp::Customer.create(
      #email: current_user.email, #email:は不要？
      card: params["payjp_token"],
      metadata: {user_id: current_user.id}
    )

    # トークン化した情報を自アプリのPayment_cardsテーブルに登録
    @card = PaymentCard.new(user_id: current_user.id, payjp_customer_id: customer.id)
    if @card.save
      redirect_to action: "index"
    else
      redirect_to action: "create"
    end
  end


  def destroy     
    # 今回はクレジットカードを削除するだけでなく、PAY.JPの顧客情報も削除する。これによりcreateメソッドが複雑にならない。
    # PAY.JPの秘密鍵をセットして、PAY.JPから情報をする。
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    # PAY.JPの顧客情報を取得
    customer = Payjp::Customer.retrieve(@card.payjp_customer_id)
    customer.delete # PAY.JPの顧客情報を削除
    if @card.destroy # App上でもクレジットカードを削除
      redirect_to action: "index", notice: "削除しました"
    else
      redirect_to action: "index", alert: "削除できませんでした"
    end
  end



  private
  def set_card
    @card = PaymentCard.where(user_id: current_user.id).first if PaymentCard.where(user_id: current_user.id).present?
  end

end
