FactoryBot.define do
  factory :vote_candidate do
    vote
    association :candidate, factory: :player

    transient do
      voters_count { 1 }
    end

    after(:build) { |vote_candidate, context|
      create_list(:player, context.voters_count, voted_candidates: [vote_candidate])
    }
  end
end
