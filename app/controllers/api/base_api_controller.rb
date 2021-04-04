module Api
  class BaseApiController < ActionController::API
    before_action :authenticate!

    private

    def render_result(result)
      if result.success
        render json: { message: result.message, value: result.value }
      else
        render json: { message: result.error }, status: result.status
      end
    end

    def authenticate!
      return if request.headers['Authorization'] == Figaro.env.api_token && !Figaro.env.api_token.nil?
        
      render json:  {message: I18n.t('unauthorized') }, status: :unauthorized
    end
  end
end