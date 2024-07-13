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
    end
  end
end