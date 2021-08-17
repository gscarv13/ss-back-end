require 'rails_helper'

describe 'Schedules Actions', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:activity) { FactoryBot.create(:activity) }
  let!(:schedule) { Schedule.create(date: Time.now, user_id: user.id, activity_id: activity.id) }

  describe 'GET /api/v1/schedules' do
    it 'should return all schedules' do
      10.times { Schedule.create(date: Time.now, user_id: user.id, activity_id: activity.id) }

      get '/api/v1/schedules'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['data'].length).to be(11)
    end
  end

  describe 'POST /api/v1/schedules' do
    it 'should create new schedule' do
      post '/api/sessions', params: { user: { email: user.email, password: user.password } }
      post '/api/v1/schedules', params: { schedule: { user_id: user.id, activity_id: activity.id, date: Time.now } }

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /api/v1/schedules/:id' do
    it 'should delete schedule' do
      post '/api/sessions', params: { user: { email: user.email, password: user.password } }
      delete "/api/v1/schedules/#{schedule.id}"

      expect(response).to have_http_status(:ok)
    end

    it 'should fail delete schedule' do
      post '/api/sessions', params: { user: { email: user.email, password: user.password } }
      delete '/api/v1/schedules/invalid_id'

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
