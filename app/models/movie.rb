class Movie < ApplicationRecord
  has_many :actors, class_name: '::Actor', inverse_of: :movie

  validates :name, uniqueness: { case_senitive: false, message: I18n.t('duplicate_name') }
  validates :name, presence: { message: I18n.t('name_blank') }
  validates :age_censure, presence: { message: I18n.t('age_censure_blank') }
  validates :age_censure, numericality: { only_integer: true, message: I18n.t('age_censure_int') }
  validates :release_date, presence: { message: I18n.t('release_date_blank') }
  validates :direction, presence: { message: I18n.t('direction_blank') }
end
