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

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq(
        {
          'user' => {
          }
        }
      )
    end

    # it 'should return error when password is invalid' do
    #   post '/api/sessions/', params: { user: { email: user.email, password: 'invalid password' } }

    #   expect(response).to have_http_status(:unprocessable_entity)
    #   expect(JSON.parse(response.body)).to eq(
    #     {
    #       'error' => 'Email or password is invalid'
    #     }
    #   )
    # end

    # it 'should create the session' do
    #   post '/api/sessions/', params: { user: { email: user.email, password: user.password } }

    #   expect(response).to have_http_status(:created)
    #   expect(JSON.parse(response.body)).to eq(
    #     {
    #       'logged_in' => true
    #     }
    #   )
    # end

    # describe 'DELETE /session' do
    #   it 'should terminate the session' do
    #     post '/api/sessions/', params: { user: { email: user.email, password: user.password } }
    #     delete "/api/sessions/#{user.id}"

    #     expect(response).to have_http_status(:ok)
    #     expect(JSON.parse(response.body)).to eq(
    #       {
    #         'logged_out' => true
    #       }
    #     )
    #   end
    # end

    # describe 'GET /logged_in' do
    #   it 'should return false if the user is not currently authenticated' do
    #     get '/api/logged_in'

    #     expect(JSON.parse(response.body)).to eq(
    #       {
    #         'logged_in' => false
    #       }
    #     )
    #   end
    # end
  end
end
