module Grids
  class FindToday
    def initialize(params)
      @params = params
    end

    def call
      grid = find_grid
      validate_not_found(grid)

      grid
    end

    private

    def find_grid
      Grid.find_by(active_on: Date.today)
    end

    def validate_not_found(grid)
      raise NotFoundError.new('Grid not found') if grid.nil?
    end
  end
end