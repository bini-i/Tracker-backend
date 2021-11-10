require 'rails_helper'

RSpec.describe 'TasksController', type: :request do
  describe 'GET /index' do
    it 'renders tasks index' do
      get '/tasks'
      expect(response).to be_success
    end
  end
  describe 'GET /create' do
    it 'renders tasks index'
  end
  describe 'GET /update' do
    it 'renders tasks index'
  end
end
