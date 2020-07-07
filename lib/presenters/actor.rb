module Presenters
  class Actor
    attr_reader :id, :name

    def initialize(attrs)
      @id = attrs[:id]
      @name = attrs[:name]
    end
  end
end
