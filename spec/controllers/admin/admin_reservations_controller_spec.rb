# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Admin::ReservationsController, type: :controller do
  describe 'GET #index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
