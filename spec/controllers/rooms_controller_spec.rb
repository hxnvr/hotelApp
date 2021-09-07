# frozen_string_literal: true

require 'rails_helper'
RSpec.describe RoomsController, type: :controller do
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
      expect(assigns(:room)).to be_a_new(Room)
    end
  end

  describe 'GET #show' do
    it 'finds a room by id' do
      room = Room.create(number: '123', description: 'aaaaaaaaaaaaaaaaaaaaaa', price: '1299')
      get :show, params: { id: room.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE #destroy' do
    it 'renders a 302 code' do
      room = Room.create(number: '123', description: 'aaaaaaaaaaaaaaaaaaaaaa', price: '1299')
      delete :destroy, params: { id: room.id }
      expect(response.status).to eq(302)
    end
    it 'deletes the room' do
      room = Room.create(number: '123', description: 'aaaaaaaaaaaaaaaaaaaaaa', price: '1299')

      expect { delete :destroy, params: { id: room.id } }.to change(Room, :count).by(-1)
    end
  end

  describe 'PUT #update' do
    it 'renders a 302 code' do
      room = Room.create(number: '123', description: 'aaaaaaaaaaaaaaaaaaaaaa', price: '1299')
      put :update, params: { id: room.id, room: { price: '1466' } }
      expect(response.status).to eq(302)
    end
    it 'with bad data' do
      room = Room.create(number: '123', description: 'aaaaaaaaaaaaaaaaaaaaaa', price: '1299')
      put :update, params: { id: room.id, room: { price: '' } }
      expect(response).not_to be_redirect
    end
  end

  describe 'POST #create' do
    it 'assigns a newly created room as @room' do
      post :create, params: { room: { number: '123', description: 'aaaaaaaaaaaaaaaaaaaaaa', price: '1299' } }
      expect(assigns(:room)).to be_a(Room)
    end
    it 'with bad data' do
      post :create, params: { room: {number: '123', description: 'aaaaaaaaaaaaaaaaaaaaaa' } }
      expect(response).not_to be_redirect
    end
  end
end
