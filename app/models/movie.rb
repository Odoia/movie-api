class Movie < ApplicationRecord
  has_many :actor, class_name: '::Actor'
end
