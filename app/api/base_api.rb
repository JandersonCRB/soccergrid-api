class BaseAPI < Grape::API
  version 'v1', using: :path
  format :json
  prefix :api

  rescue_from NotFoundError do |e|
    error!({ error: e.message, data: e.data }, 404)
  end

  mount V1::API
end
