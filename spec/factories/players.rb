FactoryBot.define do
  factory :player do
    name { Faker::Name.first_name }

    game_session

    trait :mafia do
      sequence(:role, (Role::Mafia::ROLES).shuffle.cycle)
    end

    trait :military do
      sequence(:role, (Role::Military::ROLES).shuffle.cycle)
    end

    trait :neutral do
      sequence(:role, (Role::Neutral::ROLES).shuffle.cycle)
    end
  end
end
