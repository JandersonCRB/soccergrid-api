unless Rails.env.production?
  GrapeSwaggerRails.options.url = '/api/v1/swagger_doc'
  GrapeSwaggerRails.options.app_name = 'Soccer Grid API'
  GrapeSwaggerRails.options.before_action do
    GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
  end
end
