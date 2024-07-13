module Grids
  class UserAnswer
    def initialize(params)
      @params = params
    end

    def call
      validate_grid
      unless answer_repeated?
        register_user_answer
      end

      { correct: answer_correct? }
    end

    private

    def validate_grid
      grid = Grid.find_by(id: @params[:grid_id])
      raise NotFoundError.new("Grid not found") unless grid

      if @params[:i] >= grid.grid_rows || @params[:j] >= grid.grid_columns
        raise NotFoundError.new("Cell out of bounds")
      end
    end

    def answer_repeated?
      @answer_repeated |= GridUserAnswer.exists?(grid_id: @params[:grid_id],
                                                 i: @params[:i],
                                                 j: @params[:j],
                                                 answer: @params[:answer],
                                                 remote_ip: @params[:remote_ip]
      )
    end

    def answer_correct?
      @answer_correct |= GridAnswer.exists?(grid_id: @params[:grid_id],
                                            i: @params[:i],
                                            j: @params[:j],
                                            club_key: @params[:answer]
      )
    end

    def register_user_answer
      GridUserAnswer.create!(grid_id: @params[:grid_id],
                             i: @params[:i],
                             j: @params[:j],
                             answer: @params[:answer],
                             remote_ip: @params[:remote_ip]
      )
    end
  end
end