require 'rails_helper'

describe 'Activities Actions', type: :request do
  describe 'GET /api/v1/activities' do
    it 'should return all activities' do
      10.times { FactoryBot.create(:activity) }

      get '/api/v1/activities'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).length).to be(10)
    end
  end
end
