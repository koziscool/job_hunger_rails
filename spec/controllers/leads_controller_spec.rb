require 'rails_helper'

RSpec.describe LeadsController, type: :controller do
  let(:user) { create(:user) }
  let(:json) { JSON.parse(response.body) }
  let(:company) { create(:company, user: user) }
  let(:lead) { create(:lead, company: company) }

  describe 'GET #index' do
    before do
      token_sign_in user
      lead
    end

    it 'gets all leads' do
      get :index
      expect(json['data'].length).to eq 1
    end
  end

  describe 'DELETE #destroy' do
    before do
      token_sign_in user
      lead
    end

    it 'deletes a lead' do
      expect { delete :destroy, id: lead.id }.to change { Lead.count }.by -1
    end
  end
end
