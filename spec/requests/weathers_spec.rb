require 'rails_helper'

RSpec.describe 'Todos API', type: :request do

  # Test suite for GET /
  describe 'GET /' do
    # make HTTP get request before each example
    before { get '/' }

    it 'returns home page' do
      expect(response.body).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /weathers/:city_id
  describe 'GET /weathers/:city_name' do
    before { get "/weathers/#{city_name}" }

    context 'when the city exists' do
      it 'returns the weahter data' do
        expect(response.body).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the city does not exist' do
      let(:city_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end
  end

  describe 'GET /weathers/random' do
    before { get "/weathers/random" }

    it 'returns random weather data' do
      expect(response.body).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
end
