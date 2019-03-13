require 'rails_helper'

RSpec.describe ArticleController, :type => :controller do
  context "GET #index" do
    before do
      allow(controller).to receive(:params).and_return({page: '5'})
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
