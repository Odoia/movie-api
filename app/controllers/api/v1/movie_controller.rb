module Api
  module V1
    class MovieController < ApplicationController
      before_action :movie_params, only: [:create]
      before_action :search_params, only: [:show]

      def create
        result = create_movie
        if result
          render status: 201, json: { data: result, status: 201 }
        else
          render_error
        end
      end

      def show
        result = search_movie_by_age
        unless result.blank?
          render status: 200, json: { data: result, status: 200 }
        else
          render_error(status: 404, error:I18n.t('not_found'), msg: I18n.t('movie_not_found'))
        end
      end

      private

      def create_movie
        ::Services::Movie::Create.new(movie_params: movie_params).call
      end

      def search_movie_by_age
        ::Services::Movie::ShowByAge.new(age: params[:age]).call
      end

      def movie_params
        return render_error if params[:movie].blank?

        params.require(:movie).permit(
          :name, :release_date,
          :age_censure, :direction,
          actors: { name: [] }
        )
      end

      def search_params
        begin
          return render_error(msg: I18n.t('blank_age')) if Integer(params[:age]).blank?
        rescue
          render_error(msg: I18n.t('age_must_be_a_integer'))
        end
      end

      def render_error(error: 'bad_request', status: 400, msg: '')
        render nothing: true, status: status, json: { status: status, data: I18n.t("#{error}"), msg: msg }
      end
    end
  end
end
