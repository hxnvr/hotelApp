# frozen_string_literal: true

class RecordJob < ApplicationJob
  queue_as :default

  def perform(*_args); end
end
