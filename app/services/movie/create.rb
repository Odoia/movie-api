module Services
  module Movie
    class Create

      def initialize(movie_params:)
        @name         = movie_params[:name]
        @release_date = movie_params[:release_date]
        @age_censure  = movie_params[:age_censure]
        @direction    = movie_params[:direction]
        @actors       = movie_params[:actors]
      end

      def call
        make_movie
      end

      private

      attr_reader :name, :release_date, :age_censure, :direction, :actors

      def make_movie
        ActiveRecord::Base.transaction do
          result_movie = movie_create
          return result_movie unless result_movie.errors.blank?

          result_actors = create_actors(movie_id: result_movie.id)

          ::Presenters::Movie.new(result_movie)
        end
      end

      def movie_create
        result = ::Movie.new(params_to_save)
        result.save
        result
      end

      def params_to_save
        {
          name: name,
          release_date: release_date,
          age_censure: age_censure,
          direction: direction
        }
      end

      def create_actors(movie_id:)
        ::Services::Actor::Create.new(movie_id: movie_id, actors: actors).call
      end
    end
  end
end
