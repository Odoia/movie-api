module Api
  module V1
    class MovieController < ApplicationController

      def create
        if movie_params.permitted?
          result = create_movie
          render status: 201, json: { data: result, status: 201 }
        else
          render nothing: true, status: 400, json: { status: 400, data: 'Bad Request' }
        end
      end

      private

      def create_movie
        ::Services::Movie::Create.new(movie_params: movie_params).call
      end

      def movie_params
        params.require(:movie).permit(
          :name, :release_date,
          :age_censure, :direction,
          actors: { name: [] }
        )
      end
    end
  end
end
