# spec/requests/humen_spec.rb
require 'rails_helper'

RSpec.describe 'HUMEN-API' do
  # Initialize the test data
  let!(:airplane) { create(:airplane) }
  let!(:humen) { create_list(:human, 20, airplane_id: airplane.id) }
  let(:airplane_id) { airplane.id }
  let(:id) { humen.first.id }

  # Test suite for GET /airplanes/:airplane_id/humen
  describe 'GET /airplanes/:airplane_id/humen' do
    before { get "/airplanes/#{airplane_id}/humen" }

    context 'when airplane exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all humen inside airplane' do
        expect(json.size).to eq(20)
      end
    end

    context 'when airplane does not exist' do
      let(:airplane_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Airplane with 'id'=0\"}")
      end
    end
  end

  # Test suite for GET /airplanes/:airplane_id/items/:id
  describe 'GET /airplanes/:airplane_id/humen/:id' do
    before { get "/airplanes/#{airplane_id}/humen/#{id}" }

    context 'when humen of airplane exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the humen' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when humen of airplane does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Human/)
      end
    end
  end

  # Test suite for POST /airplanes/:airplane_id/humen
  describe 'POST /airplanes/:airplane_id/humen' do
    let(:valid_attributes) { { name: 'Sponge Bob' } }

    context 'when request attributes are valid' do
      before { post "/airplanes/#{airplane_id}/humen", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/airplanes/#{airplane_id}/humen", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /airplanes/:airplane_id/humen/:id
  describe 'PUT /airplanes/:airplane_id/humen/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/airplanes/#{airplane_id}/humen/#{id}", params: valid_attributes }

    context 'when human exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the human' do
        updated_human = Human.find(id)
        expect(updated_human.name).to match(/Mozart/)
      end
    end

    context 'when the human does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Human/)
      end
    end
  end

  # Test suite for DELETE /airplanes/:id
  describe 'DELETE /airplanes/:id' do
    before { delete "/airplanes/#{airplane_id}/humen/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end