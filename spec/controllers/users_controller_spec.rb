require 'rails_helper'
RSpec.describe Api::V1::UsersController, type: :controller do
  before { allow(controller).to receive(:authenticate).and_return(true) }
  describe 'use authorize request before action' do
    context 'when authorized' do
      it { should use_before_action(:authenticate) }
    end
  end
  describe 'GET /users' do
    before { get :index }
    context 'when authorized' do
      it { expect(response).to have_http_status(:ok) }
      it { expect(response.content_type).to include('text/html') }
    end
  end
  describe 'POST  /users' do
    before { post :create }
    context 'when authorized' do
      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(response.content_type).to include('application/json') }
      it do
        should rescue_from(ActiveRecord::RecordInvalid)
          .with(:invalid)
      end
    end
  end
  describe 'GET /users/1' do
    before { get :show, params: { id: 1 } }
    context 'when authorized' do
      it do
        should rescue_from(ActiveRecord::RecordNotFound)
          .with(:not_found)
      end
      it { expect(response).to have_http_status(:not_found) }
    end
  end
  describe 'POST favorites' do
    before { post 'new_favorite' }
    context 'when authorized' do
      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(response.content_type).to include('application/json') }
      it do
        should rescue_from(ActiveRecord::RecordInvalid)
          .with(:invalid)
      end
      it do
        should rescue_from(ActiveRecord::RecordNotUnique)
          .with(:not_unique)
      end
    end
  end
end
