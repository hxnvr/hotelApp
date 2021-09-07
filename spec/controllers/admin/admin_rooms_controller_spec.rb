# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Admin::RoomsController, type: :controller do
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
      admin_room = Room.create(number: '123', description: 'aaaaaaaaaaaaaaaaaaaaaa', price: '1299')
      get :index
      expect(assigns(:admin_rooms)).to eq([admin_room])
    end
  end

  describe 'GET #new' do
    it 'has a 200 status code' do
      get :new
      expect(response.status).to eq(200)
    end
    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
    it 'loads the room into @room' do
      get :new
      expect(assigns(:admin_room)).to be_a_new(Room)
    end
  end

  describe 'GET #show' do
    it 'finds a room by id' do
      admin_room = Room.create(number: '123', description: 'aaaaaaaaaaaaaaaaaaaaaa', price: '1299')
      get :show, params: { id: admin_room.id }
      expect(response.status).to eq(200)
    end
  end


end
