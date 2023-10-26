# frozen_string_literal: true

# https://guides.rubyonrails.org/action_controller_overview.html#restful-downloads
Mime::Type.register "application/vnd.applin_response", :applin

module Applin
  # Helper functions for creating Applin responses from controllers.
  module Rails

    module_function

    def send_page(page, options = {})
      body = { page: page }.to_json
      options[:type] = Mime[:applin]
      send_data body, options
    end
  end
end
