module V1
  class GridsAPI < Grape::API
    resource :grids do
      resource :today do
        desc 'Return today\'s grid'
        get do
          grid = Grids::FindToday.new(params).call

          present grid, with: Entities::GridEntity
        end
      end

      route_param :club_id do
        resource :user_answer do
          desc 'Register a user answer for a given club',
               success: {
                 code: 200,
                 message: 'User answer is correct',
                 model: Entities::UserAnswerResponseEntity
               },
               failure: [
                 { code: 404, message: 'Grid not found' },
                 { code: 404, message: 'Cell out of bounds' }
               ]
          params do
            requires :grid_id, type: Integer, desc: 'Grid ID'
            requires :i, type: Integer, desc: 'Row index'
            requires :j, type: Integer, desc: 'Column index'
            requires :answer, type: String, desc: 'Club key'
          end
          post do
            remote_ip = request.env["action_dispatch.remote_ip"]
            params[:remote_ip] = remote_ip

            user_answer_response = Grids::UserAnswer.new(params).call

            status 200
            present user_answer_response, with: Entities::UserAnswerResponseEntity
          end
        end
      end
    end
  end
end