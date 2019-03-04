# spec/requests/airplanes_spec.rb
require 'rails_helper'

RSpec.describe 'AIRPLANE-API', type: :request do
  # initialize test data
  let!(:airplanes) { create_list(:airplane, 10) }
  let(:airplane_id) { airplanes.first.id }

  # Test suite for GET /airplanes
  describe 'GET /airplanes' do
    # make HTTP get request before each example
    before { get '/airplanes' }

    it 'returns airplanes' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /airplanes/:id
  describe 'GET /airplanes/:id' do
    before { get "/airplanes/#{airplane_id}" }

    context 'when the record exists' do
      it 'returns the airplane' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(airplane_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:airplane_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Airplane/)
      end
    end
  end

  # Test suite for POST /airplanes
  describe 'POST /airplanes' do
    # valid payload
    let(:valid_attributes) { { specificID: 1453, name: 'Boeing450' } }

    context 'when the request is valid' do
      before { post '/airplanes', params: valid_attributes }

      it 'creates a airplane' do
        expect(json['specificID']).to eq(1453)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/airplanes', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match("{\"message\":\"Validation failed: Specificid can't be blank\"}")
      end
    end
  end

  # Test suite for PUT /airplanes/:id
  describe 'PUT /airplanes/:id' do
    let(:valid_attributes) { { name: 'Shopping' } }

    context 'when the record exists' do
      before { put "/airplanes/#{airplane_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /airplanes/:id
  describe 'DELETE /airplanes/:id' do
    before { delete "/airplanes/#{airplane_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end