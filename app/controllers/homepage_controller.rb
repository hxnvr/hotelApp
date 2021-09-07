# frozen_string_literal: true

class HomepageController < ApplicationController
  def index
    @rooms = Room.all
  end
end
