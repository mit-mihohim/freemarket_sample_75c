require 'rails_helper'

describe PurchasesController do
  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end

    it "@cardに正しい値が入っていること" do
      get :new
    end

    it "indexアクションにリダイレクトすること" do
    end
  end

end