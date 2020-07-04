class Actor < ApplicationRecord
  has_one :movie, class_name: '::Movie'
end
