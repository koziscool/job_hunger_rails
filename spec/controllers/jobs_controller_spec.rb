require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  include Devise::TestHelpers

  describe 'GET#index /jobs' do
    let(:user) { create(:user) }
    let(:company) { create(:company, user: user) }
    let(:job) { create(:job, company: company) }
    let(:json) { JSON.parse(response.body) }

    before do
      token_sign_in(user)
      job
    end

    it 'gets all the jobs' do
      get :index
      print json
      expect(json['data'].length).to eq(1)
    end
  end

  describe 'DELETE/#destroy /jobs/:id' do
    let(:user) { create(:user) }
    let(:company) { create(:company, user: user) }
    let(:job) { create(:job, company: company) }

    before do
      token_sign_in(user)
      job
    end

    it 'deletes a job' do
      expect { delete :destroy, id: job.id }.to change(Job, :count).by(-1)
    end
  end
end
