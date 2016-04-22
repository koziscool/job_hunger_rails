require 'rails_helper'

RSpec.describe RecommendationsController, type: :controller do
  describe 'GET#index /recommendations' do
    let(:user) { create(:user) }
    let(:company) { create(:company, user: user) }
    # let(:recommendation) { create(:recommendation, recommendable: company)}
    let(:json) { JSON.parse(response.body) }

    before do
      token_sign_in(user)
      company
    end

    it 'returns all recommendations' do
      get :index, format: :json
      print json
    end
  end
end
