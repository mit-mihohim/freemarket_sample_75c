class PaymentCardsController < ApplicationController
  #PAYJPとやり取りするために、payjpをロード
  require "payjp"


  def new
    # cardがすでに登録済みの場合、indexのページに戻します。
    # @card = PaymentCard.where(user_id: current_user.id).first

  end

  def create
    # credentials.yml.encに記載したAPI秘密鍵を呼び出してpay.jpと通信
    Payjp.api_key = Rails.application.credentials.payjp[:payjp][:secret_key]

    # フォームの値を引数に顧客を作成。
    customer = Payjp::Customer.create(
      email: current_user.email, #email:は不要？
      card: params["payjp_token"],
      metadata: {user_id: current_user.id} #最悪なくてもOK！
    )

    # トークン化した情報を自アプリのPayment_cardsテーブルに登録
    @card = PaymentCard.new(user_id: current_user.id, payjp_customer_id: customer.id)
    if @card.save
      #もしcreateビューを作成しない場合はredirect_toなどで表示ビューを指定
    else
      redirect_to action: "create"
    end
  end

end
