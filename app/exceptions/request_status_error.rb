class RequestStatusError < StandardError
  attr_reader :status, :message

  def initialize(status, message, data)
    @status = status
    @message = message
    @data = data
  end
end