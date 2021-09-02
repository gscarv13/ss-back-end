require 'rails_helper'

describe 'SS API Sessions', type: :request do
  describe 'POST /registrations' do
    let(:user) { FactoryBot.build(:user) }
    let(:user2) { FactoryBot.build(:user) }

    it 'should return error when email is invalid' do
      post '/api/registrations/', params: {
        user: {
          first_name: user.first_name,
          last_name: user.last_name,
          password: user.password,
          password_confirmation: user.password_confirmation
        }
      }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq(
        {
          'error' => {
            'email' => ["can't be blank", 'is invalid']
          }
        }
      )
    end

    it 'should return error when password does not match is invalid' do
      post '/api/registrations/', params: {
        user: {
          first_name: user.first_name,
          last_name: user.last_name,
          email: user.email,
          password: user.password,
          password_confirmation: 'no match'
        }
      }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq(
        {
          'error' => {
            'password_confirmation' => ["doesn't match Password"]
          }
        }
      )
    end

    it 'should successed' do
      post '/api/registrations/', params: {
        user: {
          first_name: user.first_name,
          last_name: user.last_name,
          email: user.email,
          password: user.password,
          password_confirmation: user.password_confirmation
        }
      }

      expected = UserSerializer.new(user).as_json

      expect(response).to have_http_status(:created)
    end
  end
end
