# frozen_string_literal: true

class BaseService
  attr_reader :result

  def success(message, value = nil)
    create_result(message)
    @result.success = true
    @result.error = nil
    @result.status = 200
    @result.value = value
    @result
  end

  def failure(message, error = nil)
    create_result(message)
    @result.success = false
    @result.error = error || message
    @result.status = 400
    @result
  end

  protected

  def create_result(message)
    @result ||= OpenStruct.new
    @result.message = message
  end
end
