module Grids
  class Create
    def initialize(params)
      @params = params
      @grid = params[:grid]
    end

    def call
      Rails.logger.info("Creating club with #{params}")
      run_validations
      grid = build_grid
      grid.save!
    end

    private

    def run_validations
      validate_uniqueness_of_grid_number
      validate_uniqueness_of_active_on
    end

    def validate_uniqueness_of_grid_number
      if Grid.exists?(grid_number: @grid[:grid_number])
        raise BadRequestError.new("Grid number already exists")
      end
    end

    def validate_uniqueness_of_active_on
      if Grid.exists?(active_on: @grid[:active_on])
        raise BadRequestError.new("Grid active on already exists")
      end
    end

    def build_grid
      grid = Grid.new

      grid.active_on = @grid[:active_on]
      grid.grid_number = @grid[:grid_number]
      grid.grid_rows = @grid[:grid_rows]
      grid.grid_columns = @grid[:grid_columns]

      grid.grid_tips = build_grid_tips
      grid.grid_answers = build_grid_answers

      grid
    end

    def build_grid_tips
      grid_tips = []

      @grid[:tips].each do |grid_tip_params|
        grid_tip = GridTip.new

        grid_tip.i = grid_tip_params[:i]
        grid_tip.j = grid_tip_params[:j]
        grid_tip.description = grid_tip_params[:description]

        grid_tips << grid_tip
      end

      grid_tips
    end

    def build_grid_answers
      grid_answers = []

      @grid[:answers].each_pair do |k, v|

        i, j = k.split(" ")

        v.each do |club_key|
          grid_answer = GridAnswer.new

          grid_answer.i = i
          grid_answer.j = j

          grid_answer.club_key = club_key
          grid_answers << grid_answer
        end
      end

      grid_answers
    end
  end
end