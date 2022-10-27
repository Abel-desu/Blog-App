require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users#index'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/users#index'
      expect(response).to render_template('index')
    end

    it 'show correct content' do
      get '/users#index'
      expect(response.body).to include('users')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users#show'
      expect(response).to have_http_status(:success)
    end
  end
end
