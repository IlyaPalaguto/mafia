FactoryBot.define do
  factory :player do
    name { Faker::Name.with_locale("ru") { Faker::Name.first_name } }

    game_session

    trait :mafia do
      sequence(:role, Roles::Constants::MAFIA_ROLES.shuffle.cycle)
    end

    trait :civilian do
      sequence(:role, Roles::Constants::CIVILIAN_ROLES.shuffle.cycle)
    end

    trait :neutral do
      sequence(:role, Roles::Constants::NEUTRAL_ROLES.shuffle.cycle)
    end
  end
end
