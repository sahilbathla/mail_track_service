# frozen_string_literal: true

module Api
  class EmailsController < BaseApiController
    def create
      result = Emails::Create.new(params).call
      render_result(result)
    end

    def track
      Emails::Track.new(params).call
      send_file 'public/apple-touch-icon.png', type: 'image/png', disposition: 'inline'
    end
  end
end
