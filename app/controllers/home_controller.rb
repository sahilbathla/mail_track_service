# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    # Todo - Add Pagination and exclude eager loading for better scalability
    @emails = Email.includes(:email_trackings).all
  end
end
