require 'rails_helper'

describe Api::V1::EquationsController do
  describe 'POST #linear' do
    it 'with valid params' do
      post :linear, params: { coefficients: [2, -10] }

      expect(response).to have_http_status :ok
      expect(response.body).to eq({ root: [5] }.to_json)
    end

    context 'with invalid params' do
      it 'when params missing' do
        post :linear

        expect(response).to have_http_status :ok
        expect(response.body).to eq({ error: 'wrong type of coefficients (given NilClass, expected Array)' }.to_json)
      end

      it 'when wrong type of coefficients' do
        post :linear, params: { coefficients: 'coefficients' }

        expect(response).to have_http_status :ok
        expect(response.body).to eq({ error: 'wrong type of coefficients (given String, expected Array)' }.to_json)
      end

      it 'when wrong number of coefficients' do
        post :linear, params: { coefficients: [1, 2, 3] }

        expect(response).to have_http_status :ok
        expect(response.body).to eq({ error: 'wrong number of coefficients (given 3, expected 2)' }.to_json)
      end

      it 'when one of coefficients is not Numeric' do
        post :quadratic, params: { coefficients: [1, 'String', 2] }

        expect(response).to have_http_status :ok
        expect(response.body).to eq({ error: 'wrong type of coefficient' }.to_json)
      end
    end
  end

  describe 'POST #quadratic' do
    it 'with valid params' do
      post :quadratic, params: { coefficients: [1, -8, 12] }

      expect(response).to have_http_status :ok
      expect(response.body).to eq({ roots: [6, 2] }.to_json)
    end

    context 'with invalid params' do
      it 'when params missing' do
        post :quadratic

        expect(response).to have_http_status :ok
        expect(response.body).to eq({ error: 'wrong type of coefficients (given NilClass, expected Array)' }.to_json)
      end

      it 'when wrong type of coefficients' do
        post :quadratic, params: { coefficients: 'coefficients' }

        expect(response).to have_http_status :ok
        expect(response.body).to eq({ error: 'wrong type of coefficients (given String, expected Array)' }.to_json)
      end

      it 'when wrong number of coefficients' do
        post :quadratic, params: { coefficients: [1, 2] }

        expect(response).to have_http_status :ok
        expect(response.body).to eq({ error: 'wrong number of coefficients (given 2, expected 3)' }.to_json)
      end

      it 'when wrong value of `a` coefficient' do
        post :quadratic, params: { coefficients: [0, 2, 3] }

        expect(response).to have_http_status :ok
        expect(response.body).to eq({ error: "wrong value of `a` coefficient (can't be 0)" }.to_json)
      end

      it 'when one of coefficients is not Numeric' do
        post :quadratic, params: { coefficients: [1, 'String', 2] }

        expect(response).to have_http_status :ok
        expect(response.body).to eq({ error: 'wrong type of coefficient' }.to_json)
      end
    end
  end
end
