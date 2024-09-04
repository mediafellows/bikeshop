require 'rails_helper'

describe Api::V1::ProductsController, type: :controller do
  let(:brand)              { create(:brand) }
  let(:valid_attributes)   { { name: 'Test Product', description: 'A test product', price: 19.99, brand_id: brand.id } }
  let(:invalid_attributes) { { name: '', description: 'Invalid product', price: -10, brand_id: nil } }

  describe 'GET #index' do
    before do
      create_list(:product, 20)
      get :index
    end

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'returns all products' do
      expect(JSON.parse(response.body).size).to eq(20)
    end
  end

  describe 'GET #show' do
    let!(:product) { create(:product, brand: brand) }

    it 'returns a success response' do
      get :show, params: { id: product.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Product' do
        expect {
          post :create, params: { product: valid_attributes }
        }.to change(Product, :count).by(1)
      end

      it 'renders a JSON response with the new product' do
        post :create, params: { product: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)['name']).to eq('Test Product')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors' do
        post :create, params: { product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      let(:new_attributes) { { name: 'Updated Product' } }

      it 'updates the requested product' do
        product = create(:product, brand: brand)
        patch :update, params: { id: product.to_param, product: new_attributes }
        product.reload
        expect(product.name).to eq('Updated Product')
      end

      it 'renders a JSON response with the product' do
        product = create(:product, brand: brand)
        patch :update, params: { id: product.to_param, product: valid_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors' do
        product = create(:product, brand: brand)
        patch :update, params: { id: product.to_param, product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested product' do
      product = create(:product, brand: brand)
      expect {
        delete :destroy, params: { id: product.to_param }
      }.to change(Product, :count).by(-1)
    end
  end
end
