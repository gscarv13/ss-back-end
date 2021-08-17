require 'rails_helper'

describe 'SS API Sessions', type: :request do
  describe 'POST /sessions' do
    let(:user) { FactoryBot.create(:user) }

    it 'should return error when email is invalid' do
      post '/api/sessions/', params: { user: { email: 'invalid mail', password: user.password } }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq(
        {
          'error' => 'Email or password is invalid'
        }
      )
    end

    it 'should return error when password is invalid' do
      post '/api/sessions/', params: { user: { email: user.email, password: 'invalid password' } }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq(
        {
          'error' => 'Email or password is invalid'
        }
      )
    end

    it 'should create the session' do
      post '/api/sessions/', params: { user: { email: user.email, password: user.password } }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq(UserSerializer.new(user).as_json)
    end

    describe 'DELETE /session' do
      it 'should terminate the session' do
        post '/api/sessions/', params: { user: { email: user.email, password: user.password } }
        delete "/api/sessions/#{user.id}"

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to eq(
          {
            'logged_out' => true
          }
        )
      end
    end

    describe 'GET /logged_in' do
      it 'should return false if the user is not currently authenticated' do
        get '/api/logged_in'

        expect(JSON.parse(response.body)).to eq(
          {
            'logged_in' => false
          }
        )
      end
    end
  end
end
