class Movie < ApplicationRecord
  has_many :actor, class_name: '::Actor'

  def self.full_movie
    require 'pry'; binding.pry
  end

  def clean_actor
    actor.name_and_id
  end

  def self.age_censure

  end
end
