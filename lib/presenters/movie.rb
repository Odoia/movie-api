module Presenters
  class Movie
    attr_reader :id, :name, :release_date, :age_censure, :direction, :actors

    def initialize(attrs)
      @id = attrs[:id]
      @name = attrs[:name]
      @release_date = attrs[:release_date]&.to_date.to_s
      @age_censure = attrs[:age_censure]
      @direction = attrs[:direction]
      @actors = actor_hash(attrs.actor)
    end

    private

    def actor_hash(actors)
      actors.map{|actor| ::Presenters::Actor.new(actor) }
    end

  end
end
