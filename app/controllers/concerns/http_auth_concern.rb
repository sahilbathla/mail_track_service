# frozen_string_literal: true

module HttpAuthConcern
  extend ActiveSupport::Concern
  included do
    before_action :http_authenticate
  end
  def http_authenticate
    return true unless Rails.env.production?

    authenticate_or_request_with_http_basic do |username, password|
      username == Figaro.env.dashboard_user_name && password == Figaro.env.dashboard_user_password
    end
  end
end
