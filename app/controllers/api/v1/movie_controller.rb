module Api
  module V1
    class MovieController < ApplicationController
      before_action :movie_params, only: [:create]

      def create
        result = create_movie
        if result
          render status: 201, json: { data: result, status: 201 }
        else
          render_error
        end
      end

      def show

        require 'pry'; binding.pry
      end

      private

      def create_movie
        ::Services::Movie::Create.new(movie_params: movie_params).call
      end

      def movie_params
        return render_error if params[:movie].blank?

        params.require(:movie).permit(
          :name, :release_date,
          :age_censure, :direction,
          actors: { name: [] }
        )
      end

      def render_error
        render nothing: true, status: 400, json: { status: 400, data: I18n.t('bad_request') }
      end
    end
  end
end
