# frozen_string_literal: true

module Emails
  class Track < BaseService
    def initialize(params, request)
      super()
      @params = params
      @request = request
    end

    def call
      email = Email.find_by(unique_id: @params[:email_unique_id])
      return failure(:email_not_found) if email.blank?

      EmailTracking.create!(email: email, ip: @request.ip, user_agent: @request.user_agent)
      success(:email_creation_passed)
    rescue StandardError => e
      # Todo
      # 1. Add logger to save why invoice creation Failed
      # 2. Use DRY gem for result
      failure(:invoice_creation_failed, e.message)
    end
  end
end
