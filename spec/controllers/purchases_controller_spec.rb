require 'rails_helper' # rspecの設定の読み込み

describe PurchasesController, type: :controller do
  describe 'GET #buy' do
    it "buy.html.hamlに遷移すること" do # exampleの説明。以下実際に作動するテストコード。
      get :buy # 擬似的なリクエスト
      # 「expect」はエクスペクテーション。評価される式のこと。
      # 「response」はリクエストが行われた後の遷移先のビューの情報を持つインスタンス。
      # 「A.to B」は「AがBであること」の意味
      # 「render_template」マッチャはアクションがリクエストされた時に自動的に遷移するビューを返す
      expect(response).to render_template :buy
    end

    it "@card_infoに正しい値が入っていること" do
    end

    it "カード未登録の場合、PaymentCardsコントローラーのnewアクションにリダイレクトすること" do
    end
  end

  describe 'POST #pay' do
  end
end