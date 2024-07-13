class NotFoundError < RequestStatusError
  def initialize(message = 'Not Found', data = nil)
    super(message, 404, data)
  end
end