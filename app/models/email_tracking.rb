# frozen_string_literal: true

class EmailTracking < ApplicationRecord
  # Associations
  belongs_to :email

  # Callbacks
  after_create :mark_email_opened

  private

  def mark_email_opened
    # Todo - cache email opened at to avoid checking DB everytime email opened
    email.update!(opened_at: created_at) unless email.opened_at
  end
end
