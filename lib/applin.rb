# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength, Metrics/ParameterLists

# noinspection RubyTooManyMethodsInspection
module Applin
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

  module_function

  # Actions ###################################################################

  def choose_photo(upload_url:, aspect_ratio: nil)
    { typ: "choose_photo", url: upload_url, aspect_ratio: aspect_ratio }
  end

  def copy_to_clipboard(text)
    { typ: "copy_to_clipboard", string_value: text }
  end

  def launch_url(url)
    { typ: "launch_url", url: url }
  end

  def logout
    { typ: "logout" }
  end

  def modal_button(text:, actions:)
    { text: text, actions: actions }
  end

  def modal(title:, buttons:, message: nil)
    { typ: "modal", title: title, message: message, buttons: buttons }
  end

  def poll
    { typ: "poll" }
  end

  def pop
    { typ: "pop" }
  end

  def push(page_key)
    { typ: "push", page: page_key }
  end

  def replace_all(page_key)
    { typ: "replace_all", page: page_key }
  end

  def rpc(url:, on_user_error_poll: nil)
    { typ: "rpc", url: url, on_user_error_poll: on_user_error_poll }
  end

  def take_photo(upload_url:, aspect_ratio: nil)
    { typ: "take_photo", url: upload_url, aspect_ratio: aspect_ratio }
  end

  # Pages #####################################################################

  def nav_page(
    title:,
    start: nil,
    end_: nil,
    ephemeral: nil,
    stream: nil,
    poll_seconds: nil,
    &widget_block
  )
    {
      typ: :nav_page,
      start: start,
      end: end_,
      ephemeral: ephemeral,
      title: title,
      stream: stream,
      poll_seconds: poll_seconds,
      widget: widget_block.yield,
    }.compact
  end

  def plain_page(title: nil, ephemeral: nil, stream: nil, poll_seconds: nil, &widget_block)
    {
      typ: :plain_page,
      title: title,
      ephemeral: ephemeral,
      stream: stream,
      poll_seconds: poll_seconds,
      widget: widget_block.yield,
    }.compact
  end

  # Widgets ###################################################################

  def back_button(actions:)
    { typ: :back_button, actions: actions }
  end

  def button(text:, actions:)
    { typ: :button, text: text, actions: actions }
  end

  def checkbox(text:, var_name:, actions: nil, initial_bool: nil, poll_delay_ms: nil)
    {
      typ: :checkbox,
      actions: actions,
      initial_bool: initial_bool,
      poll_delay_ms: poll_delay_ms,
      text: text,
      var_name: var_name,
    }.compact
  end

  def column(widgets:, align: nil, spacing: nil)
    { typ: :column, align: align, spacing: spacing, widgets: widgets }.compact
  end

  def empty
    { typ: :empty }
  end

  # The client replaces `${INTERACTIVE_ERROR_DETAILS}` with the text of the last error.
  def error_text(text)
    { typ: :error_text, text: text }
  end

  def form(widgets:)
    { typ: :form, widgets: widgets }
  end

  def form_button(text:, actions:, align: nil)
    { typ: :form_button, align: align, text: text, actions: actions }.compact
  end

  def form_section(widgets:, title: nil)
    { typ: :form_section, title: title, widgets: widgets }.compact
  end

  # `row_groups` is a an array of row groups.
  # Each row group is an array of rows.
  # Each row is an array of widgets.
  def grouped_row_table(row_groups:, spacing: nil)
    { typ: :grouped_row_table, spacing: spacing, row_groups: row_groups }.compact
  end

  # Pass one of the DISPOSITION_* values for the `disposition` parameter.
  def image(aspect_ratio:, url:, disposition: nil)
    { typ: :image, disposition: disposition, aspect_ratio: aspect_ratio, url: url }.compact
  end

  def last_error_text
    { typ: :last_error_text }
  end

  def nav_button(text:, actions:, badge_text: nil, photo_url: nil, sub_text: nil)
    {
      typ: :nav_button,
      badge_text: badge_text,
      photo_url: photo_url,
      sub_text: sub_text,
      text: text,
      actions: actions,
    }.compact
  end

  def scroll(&widget_block)
    { typ: :scroll, widget: widget_block.yield }
  end

  # `rows` is a an array of rows.
  # Each row is an array of widgets.
  def table(rows:, spacing: nil)
    { typ: :grouped_row_table, spacing: spacing, row_groups: [rows] }.compact
  end

  def text(text)
    { typ: :text, text: text }
  end

  # Pass one of the ALLOW_* values for `allow`.
  # Pass one of the AUTO_CAPITALIZE_* values for `auto_capitalize`.
  def textfield(
    var_name:,
    allow: nil,
    auto_capitalize: nil,
    error: nil,
    initial_string: nil,
    label: nil,
    max_chars: nil,
    max_lines: nil,
    min_chars: nil,
    poll_delay_ms: nil
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
      poll_delay_ms: poll_delay_ms,
      var_name: var_name,
    }.compact
  end

  # rubocop:enable Metrics/MethodLength, Metrics/ParameterLists
end
