class Actor < ApplicationRecord
  belongs_to :movie, class_name: '::Movie'
  validates :movie, presence: true
end
