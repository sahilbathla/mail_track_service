# frozen_string_literal: true

module Emails
  class Create < BaseService
    def initialize(params)
      super()
      @params = params
    end

    def call
      email = Email.create!(email_params)
      success(:email_creation_passed)
    rescue StandardError => e
      # Todo
      # 1. Add logger to save why invoice creation Failed
      # 2. Use DRY gem for result
      failure(:invoice_creation_failed, e.message)
    end

    private

    def email_params
      @params.require(:email).permit(:to, :from, :content, :subject, :bcc, :cc, :unique_id)
    end
  end
end
