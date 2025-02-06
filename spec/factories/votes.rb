FactoryBot.define do
  factory :vote do
    association :game_session
  end
end
