class Actor < ApplicationRecord
  has_one :movie, class_name: '::Movie'


  def self.name_and_id
    require 'pry'; binding.pry
    # self.
  end
end
