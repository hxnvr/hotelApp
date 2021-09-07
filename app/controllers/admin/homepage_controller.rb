# frozen_string_literal: true

module Admin
  class HomepageController < ApplicationController
    before_action :require_login
    def index; end
  end
end
