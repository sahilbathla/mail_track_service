# frozen_string_literal: true

class Email < ApplicationRecord
  # Validations
  validates :to, :from, :subject, :content, :unique_id, presence: true
  validates :unique_id, uniqueness: true
  validates :from, format: { with: Constants::Regex::EMAIL }
  validates :to, format: { with: Constants::Regex::COMMA_SEPARATED_EMAIL }
  validates :bcc, :cc, format: { with: Constants::Regex::COMMA_SEPARATED_EMAIL, allow_blank: true }

  # Callbacks
  before_create :assign_tracking_url
  after_create  :send_email

  private

  def assign_tracking_url
    # Todo - For now using RFC822 Unique id to track but ideally should be encrypted
    self.tracking_url = "/emails/track/#{unique_id}"
  end

  def send_email
    # Todo - For now using deliver_now but should be deliver_later via sidekiq
    ApplicationMailer.send_email(self).deliver_now
  end
end
