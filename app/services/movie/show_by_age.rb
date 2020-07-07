module Services
  module Movie
    class ShowByAge

      def initialize(age:)
        @age = age.to_i
      end

      def call
        movie_by_age
      end

      private

      attr_reader :age

      def movie_by_age
        result = ::Movie.where("age_censure <=?", age)
        movie_presenter(array_movie: result)
      end

      def movie_presenter(array_movie:)
        array_movie.map do |movie|
          ::Presenters::Movie.new(movie)
        end
      end
    end
  end
end
