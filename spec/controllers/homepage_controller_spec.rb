# frozen_string_literal: true

require 'rails_helper'
RSpec.describe HomepageController, type: :controller do
  describe 'GET #index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
    it 'loads all of the rooms into @rooms' do
      room = Room.create(number: '123', description: 'aaaaaaaaaaaaaaaaaaaaaa', price: '1299')
      get :index
      expect(assigns(:rooms)).to eq([room])
    end
  end
end
