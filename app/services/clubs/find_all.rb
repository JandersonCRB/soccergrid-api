module Clubs
  class FindAll
    def initialize(params)
      @params = params
    end

    def call
      Club.all
    end
  end
end