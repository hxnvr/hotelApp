# frozen_string_literal: true
#

require 'rails_helper'
RSpec.describe ReviewsController, type: :controller do
  describe 'GET #index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
    it 'loads all of the reviews into @reviews' do
      review = Review.create(author: 'dd', email: 'aa@mail.ru', review_body: 'aaaaaaaaaaaaa', confirmed: true)
      get :index
      expect(assigns(:reviews)).to eq([review])
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
    it 'loads the review into @review' do
      get :new
      expect(assigns(:review)).to be_a_new(Review)
    end
  end

  describe 'GET #show' do
    it 'finds a review by id' do
      review = Review.create(author: 'dd', email: 'aa@mail.ru', review_body: 'aaaaaaaaaaaaa', confirmed: true)
      get :show, params: { id: review.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE #destroy' do
    it 'renders a 302 code' do
      review = Review.create(author: 'dd', email: 'aa@mail.ru', review_body: 'aaaaaaaaaaaaa', confirmed: true)
      delete :destroy, params: { id: review.id }
      expect(response.status).to eq(302)
    end
    it 'deletes the review' do
      review = Review.create(author: 'dd', email: 'aa@mail.ru', review_body: 'aaaaaaaaaaaaa', confirmed: true)

      expect { delete :destroy, params: { id: review.id } }.to change(Review, :count).by(-1)
    end
  end

  describe 'PUT #update' do
    it 'renders a 302 code' do
      review = Review.create(author: 'dd', email: 'aa@mail.ru', review_body: 'aaaaaaaaaaaaa', confirmed: true)
      put :update, params: { id: review.id, review: { confirmed: true } }
      expect(response.status).to eq(302)
    end
  end

  describe 'POST #create' do
    it 'assigns a newly created review as @review' do
      post :create, params: { review: { author: 'dd', email: 'aa@mail.ru', review_body: 'aaaaaaaaaaaaa' } }
      expect(assigns(:review)).to be_a(Review)
    end
    it 'with bad data' do
      post :create, params: { review: { author: 'ss', email: 'aamail.ru' } }
      expect(response).not_to be_redirect
    end
  end
end
