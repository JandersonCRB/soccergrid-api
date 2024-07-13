module Grids
  class FindById
    def initialize(params)
      @params = params
    end

    def call
      find_by_id
    end

    def find_by_id
      grid = Grid.find_by(id: @params[:grid_id])
      return grid if grid.present?
      raise NotFoundError.new 'Grid not found'
    end
  end
end