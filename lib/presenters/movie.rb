module Presenters
  class Movie
    attr_reader :id, :name, :release_date, :age_censure, :direction, :actors

    def initialize(attrs)
      @id = attrs[:id]
      @name = attrs[:name]
      @release_date = attrs[:release_date]&.to_date.to_s
      @age_censure = attrs[:age_censure]
      @censorship_notice = censure_notice(attrs[:age_censure])
      @direction = attrs[:direction]
      @actors = actor_hash(attrs.actors)
    end

    private

    def actor_hash(actors)
      actors.map { |actor| ::Presenters::Actor.new(actor) }
    end

    def censure_notice(age)
      return I18n.t('not_recommended', age: age) if age >= 10

      I18n.t('recommended')
    end
  end
end
