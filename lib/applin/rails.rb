# frozen_string_literal: true
require_relative "rails/version"

# https://guides.rubyonrails.org/action_controller_overview.html#restful-downloads
Mime::Type.register "application/vnd.applin_response", :applin_response

ActionController::Renderers.add :applin_response do |obj, options|
  body = { page: obj }.to_json
  options[:type] = Mime[:applin_response]
  send_data body, options
end

module Applin
  module Rails
    ALIGN_CENTER = "center"
    ALIGN_END = "end"
    ALIGN_START = "start"
    ALLOW_ALL = "all"
    ALLOW_ASCII = "ascii"
    ALLOW_EMAIL = "email"
    ALLOW_NUMBERS = "numbers"
    ALLOW_TEL = "tel"
    AUTO_CAPITALIZE_NAMES = "names"
    AUTO_CAPITALIZE_SENTENCES = "sentences"
    DISPOSITION_FIT = "fit"
    DISPOSITION_STRETCH = "stretch"
    DISPOSITION_COVER = "cover"

    def send_page(page, options = {})
      body = { page: page }.to_json
      options[:type] = Mime[:applin_response]
      send_data body, options
    end

    def back_button(actions:)
      { typ: :back_button, actions: actions }
    end

    def button(text:, actions:)
      { typ: :button, text: text, actions: actions }
    end

    def checkbox(text:, var_name:, actions: nil, initial_bool: nil, rpc: nil)
      {
        typ: :checkbox,
        actions: actions,
        initial_bool: initial_bool,
        rpc: rpc,
        text: text,
        var_name: var_name,
      }.reject { |_k, v| v.nil? }
    end

    def column(widgets:, align: nil, spacing: nil)
      { typ: :column, align: align, spacing: spacing, widgets: widgets }.reject { |_k, v| v.nil? }
    end

    def empty
      { typ: :empty }
    end

    def error_text(text)
      { typ: :error_text, text: text }
    end

    def form(widgets:)
      { typ: :form, widgets: widgets }
    end

    def form_button(text:, actions:, align: nil)
      { typ: :form_button, align: align, text: text, actions: actions }.reject { |_k, v| v.nil? }
    end

    def form_section(widgets:, title: nil)
      { typ: :form_section, title: title, widgets: widgets }.reject { |_k, v| v.nil? }
    end

    # `row_groups` is a an array of arrays of widgets.
    def grouped_row_table(row_groups:, spacing: nil)
      { typ: :grouped_row_table, spacing: spacing, row_groups: row_groups }.reject { |_k, v| v.nil? }
    end

    # Pass one of the DISPOSITION_* values for the `disposition` parameter.
    def image(aspect_ratio:, url:, disposition: nil)
      { typ: :image, disposition: disposition, aspect_ratio: aspect_ratio, url: url }.reject { |_k, v| v.nil? }
    end

    def last_error_text
      { typ: :last_error_text }
    end

    def modal_button(text:, actions:, is_cancel: nil, is_default: nil, is_destructive: nil)
      {
        typ: :modal_button,
        is_cancel: is_cancel,
        is_default: is_default,
        is_destructive: is_destructive,
        text: text,
        actions: actions,
      }.reject { |_k, v| v.nil? }
    end

    def ok_modal_button(is_default: true)
      modal_button(text: "OK", is_default: is_default, actions: [pop])
    end

    def cancel_modal_button(is_default: false)
      modal_button(text: "Cancel", is_default: is_default, actions: [pop])
    end

    def nav_button(text:, actions:, badge_text: nil, photo_url: nil, sub_text: nil)
      {
        typ: :nav_button,
        badge_text: badge_text,
        photo_url: photo_url,
        sub_text: sub_text,
        text: text,
        actions: actions,
      }.reject { |_k, v| v.nil? }
    end

    def scroll(&widget_block)
      { typ: :scroll, widget: widget_block.yield }
    end

    def text(text)
      { typ: :text, text: text }
    end

    # Pass one of the ALLOW_* values for `allow`.
    # Pass one of the AUTO_CAPITALIZE_* values for `auto_capitalize`.
    def textfield(
      var_name:, allow: nil,
      auto_capitalize: nil,
      error: nil,
      initial_string: nil,
      label: nil,
      max_chars: nil,
      max_lines: nil,
      min_chars: nil
    )
      {
        typ: :textfield,
        allow: allow,
        auto_capitalize: auto_capitalize,
        error: error,
        initial_string: initial_string,
        label: label,
        max_chars: max_chars,
        max_lines: max_lines,
        min_chars: min_chars,
        var_name: var_name,
      }.reject { |_k, v| v.nil? }
    end

    def alert_modal(title:, modal_buttons:, stream: nil, poll_seconds: nil, text: nil)
      {
        typ: :alert_modal,
        stream: stream,
        poll_seconds: poll_seconds,
        text: text,
        title: title,
        widgets: modal_buttons
      }.reject { |_k, v| v.nil? }
    end

    def drawer_modal(title:, modal_buttons:, stream: nil, poll_seconds: nil, text: nil)
      {
        typ: :drawer_modal,
        stream: stream,
        poll_seconds: poll_seconds,
        text: text,
        title: title,
        widgets: modal_buttons
      }.reject { |_k, v| v.nil? }
    end

    def nav_page(title:, start: nil, end_: nil, stream: nil, poll_seconds: nil, &widget_block)
      {
        typ: :nav_page,
        start: start,
        end: end_,
        title: title,
        stream: stream,
        poll_seconds: poll_seconds,
        widget: widget_block.yield
      }.reject { |_k, v| v.nil? }
    end

    def plain_page(title: nil, stream: nil, poll_seconds: nil, &widget_block)
      {
        typ: :plain_page,
        title: title,
        stream: stream,
        poll_seconds: poll_seconds,
        widget: widget_block.yield
      }.reject { |_k, v| v.nil? }
    end

    def choose_photo(upload_url:)
      "choose_photo:#{upload_url}"
    end

    def copy_to_clipboard(text)
      "copy_to_clipboard:#{text}"
    end

    def launch_url(url)
      "launch_url:#{url}"
    end

    def logout
      "logout"
    end

    def nothing
      "nothing"
    end

    def poll
      "poll"
    end

    def pop
      "pop"
    end

    def push(page_key)
      "push:#{page_key}"
    end

    def replace_all(page_key)
      "replace_all:#{page_key}"
    end

    def rpc(url)
      "rpc:#{url}"
    end

    def take_photo(upload_url:)
      "take_photo:#{upload_url}"
    end
  end
end
