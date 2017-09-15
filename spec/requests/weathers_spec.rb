require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  # initialize 100 cities
  let!(:cities) { create_list(:city, 100) }
  let(:city_name) { cities.first.name }

  # Test suite for GET /
  describe 'GET /' do
    # make HTTP get request before each example
    before { get '/' }

    it 'returns random city data' do
      expect(response.body).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /?city_name=CityName
  describe 'GET /?city_name=CityName' do
    context 'when the city exists' do

      before { get "/?city_name=#{city_name}" }

      it 'returns the weahter data' do
        expect(response.body).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the city does not exist' do
      let(:city_name) { 'm' }

      before { get "/?city_name=#{city_name}" }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a no data message' do
        expect(response.body).to match /NO DATA/
      end
    end

    context 'when the city name empty' do
      let(:city_name) { '' }

      before { get "/?city_name=#{city_name}" }

      it 'returns random city data' do
        expect(response.body).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET /unrouted_url' do
    context 'when the city exists' do

      before { get '/unrouted_url' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a no data message' do
        expect(response.body).to match /NO DATA/
      end
    end
  end
end
