# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  it { should use_before_action(:authenticate_user!) }
  describe 'GET #index' do
    it { expect(response).to have_http_status(:success) }
  end
  describe 'POST #show' do
    it { expect(response).to have_http_status(:success) }
  end
  describe 'GET #edit' do
    it { expect(response).to have_http_status(:success) }
  end
  describe 'PUT #update' do
    it { expect(response).to have_http_status(:success) }
  end
end
