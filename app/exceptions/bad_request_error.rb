class BadRequestError < RequestStatusError
  def initialize(message = 'Bad Request', data = nil)
    super(400, message, data)
  end
end