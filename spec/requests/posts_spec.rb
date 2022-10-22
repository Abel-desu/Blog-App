require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /comments' do
    it 'returns http success' do
      get '/posts/comments'
      expect(response).to have_http_status(:success)
    end
  end
end
