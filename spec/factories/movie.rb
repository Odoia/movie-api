FactoryBot.define do
  factory :movie_18_plus, class: '::Movie' do
    id { Faker::Number.number(digits: 5) }
    name { Faker::Lorem.word }
    release_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    age_censure { 18 }
    direction { Faker::Name.name }

    factory :complete_movie_18_plus do
      transient do
        actor_count { 3 }
      end

      after(:create) do |movie, evaluator|
        create_list(:actor, evaluator.actor_count, movie_id: movie.id)
      end
    end
  end

  factory :movie_up_to_16, class: '::Movie' do
    id { Faker::Number.number(digits: 5) }
    name { Faker::Lorem.word }
    release_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    age_censure { 16 }
    direction { Faker::Name.name }

    factory :complete_movie_up_to_16 do
      transient do
        actor_count { 3 }
      end

      after(:create) do |movie, evaluator|
        create_list(:actor, evaluator.actor_count, movie_id: movie.id)
      end
    end
  end

  factory :movie_up_to_14, class: '::Movie' do
    id { Faker::Number.number(digits: 5) }
    name { Faker::Lorem.word }
    release_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    age_censure { 14 }
    direction { Faker::Name.name }

    factory :complete_movie_up_to_14 do
      transient do
        actor_count { 3 }
      end

      after(:create) do |movie, evaluator|
        create_list(:actor, evaluator.actor_count, movie_id: movie.id)
      end
    end
  end

  factory :movie_up_to_12, class: '::Movie' do
    id { Faker::Number.number(digits: 5) }
    name { Faker::Lorem.word }
    release_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    age_censure { 12 }
    direction { Faker::Name.name }

    factory :complete_movie_up_to_12 do
      transient do
        actor_count { 3 }
      end

      after(:create) do |movie, evaluator|
        create_list(:actor, evaluator.actor_count, movie_id: movie.id)
      end
    end
  end

  factory :movie_up_to_10, class: '::Movie' do
    id { Faker::Number.number(digits: 5) }
    name { Faker::Lorem.word }
    release_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    age_censure { 10 }
    direction { Faker::Name.name }

    factory :complete_movie_up_to_10 do
      transient do
        actor_count { 3 }
      end

      after(:create) do |movie, evaluator|
        create_list(:actor, evaluator.actor_count, movie_id: movie.id)
      end
    end
  end

  factory :movie_with_free_classification, class: '::Movie' do
    id { Faker::Number.number(digits: 5) }
    name { Faker::Lorem.word }
    release_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    age_censure { 9 }
    direction { Faker::Name.name }

    factory :complete_movie_with_free_classification do
      transient do
        actor_count { 3 }
      end

      after(:create) do |movie, evaluator|
        create_list(:actor, evaluator.actor_count, movie_id: movie.id)
      end
    end
  end
end
