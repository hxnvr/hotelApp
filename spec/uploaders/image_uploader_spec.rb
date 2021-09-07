# frozen_string_literal: true

require 'rails_helper'

describe CarrierWave::Uploader do
  before do
    @uploader_class = Class.new(CarrierWave::Uploader::Base)
    @uploader = @uploader_class.new
  end

  describe '#store_dir' do
    it 'should default to the config option' do
      expect(@uploader.store_dir).to eq('uploads')
    end
  end
end
