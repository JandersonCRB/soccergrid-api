class BaseAPI < Grape::API
  version 'v1', using: :path
  format :json
  prefix :api

  mount V1::API
end
