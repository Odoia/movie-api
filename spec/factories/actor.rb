FactoryBot.define do
  factory :actor, class: '::Actor' do
    name { Faker::Name.name }
  end
end
