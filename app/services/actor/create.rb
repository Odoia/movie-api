module Services
  module Actor
    class Create

      def initialize(movie_id:, actors:)
        @movie_id = movie_id
        @names    = actors[:name]
      end

      def call
        actor_create
      end

      private

      attr_reader :names, :movie_id

      def actor_create
        names.map do |name|
          result = ::Actor.new(params_to_save(name: name))
          result.save
          result
        end
      end

      def params_to_save(name:)
        {
          name: name,
          movie_id: movie_id
        }
      end

    end
  end
end
