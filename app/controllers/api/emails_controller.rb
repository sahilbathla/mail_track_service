# frozen_string_literal: true

module Api
  class EmailsController < BaseApiController
    skip_before_action :authenticate!, only: :track

    def create
      result = Emails::Create.new(params).call
      render_result(result)
    end

    def track
      Emails::Track.new(params, request).call
      send_file 'app/assets/images/tracking.png', type: 'image/png', disposition: 'inline'
    end
  end
end
