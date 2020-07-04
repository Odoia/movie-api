FactoryBot.define do
  id = Faker::Number.number(digits: 2) 
  factory :complete_movie_18_plus, class: '::Movie' do
    id { id }
    name { Faker::Lorem.word }
    release_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    age_censure { 18 }
    direction { Faker::Name.name }
    [
      FactoryBot.create(:actor, movie_id: id),
      FactoryBot.create(:actor, movie_id: id),
      FactoryBot.create(:actor, movie_id: id)
    ]
  end

  factory :complete_movie_up_to_16, class: '::Movie' do
    id { id }
    name { Faker::Lorem.word }
    release_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    age_censure { 16 }
    direction { Faker::Name.name }
    [
      FactoryBot.create(:actor, movie_id: id),
      FactoryBot.create(:actor, movie_id: id),
      FactoryBot.create(:actor, movie_id: id)
    ]
  end

  factory :complete_movie_up_to_14, class: '::Movie' do
    id { id }
    name { Faker::Lorem.word }
    release_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    age_censure { 14 }
    direction { Faker::Name.name }
    [
      FactoryBot.create(:actor, movie_id: id),
      FactoryBot.create(:actor, movie_id: id),
      FactoryBot.create(:actor, movie_id: id)
    ]
  end

  factory :complete_movie_up_to_12, class: '::Movie' do
    id { id }
    name { Faker::Lorem.word }
    release_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    age_censure { 12 }
    direction { Faker::Name.name }
    [
      FactoryBot.create(:actor, movie_id: id),
      FactoryBot.create(:actor, movie_id: id),
      FactoryBot.create(:actor, movie_id: id)
    ]
  end

  factory :complete_movie_up_to_10, class: '::Movie' do
    id { id }
    name { Faker::Lorem.word }
    release_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    age_censure { 10 }
    direction { Faker::Name.name }
    [
      FactoryBot.create(:actor, movie_id: id),
      FactoryBot.create(:actor, movie_id: id),
      FactoryBot.create(:actor, movie_id: id)
    ]
  end

  factory :complete_movie_with_free_classification, class: '::Movie' do
    id { id }
    name { Faker::Lorem.word }
    release_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    age_censure { 12 }
    direction { Faker::Name.name }
    [
      FactoryBot.create(:actor, movie_id: id),
      FactoryBot.create(:actor, movie_id: id),
      FactoryBot.create(:actor, movie_id: id)
    ]
  end
end
