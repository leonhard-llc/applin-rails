# frozen_string_literal: true

require_relative "rails/version"
require "action_controller"

# https://guides.rubyonrails.org/action_controller_overview.html#restful-downloads
Mime::Type.register "application/vnd.applin_response", :applin_response

ActionController::Renderers.add :applin_response do |obj, options|
  body = { page: obj }.to_json
  options[:type] = Mime[:applin_response]
  send_data body, options
end

module Applin
  module Rails
    def send_page(page, options = {})
      body = { page: page }.to_json
      options[:type] = Mime[:applin_response]
      send_data body, options
    end
  end
end

