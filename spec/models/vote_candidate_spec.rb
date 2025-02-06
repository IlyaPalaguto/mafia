require 'rails_helper'

RSpec.describe VoteCandidate, type: :model do
  describe "associations" do
    it { should belong_to :vote }
    it { should belong_to(:candidate).class_name("Player") }
    it { should have_and_belong_to_many(:voters).class_name("Player") }
  end

  describe "delegates" do
    it { should delegate_method(:name).to(:candidate) }
  end

  describe "scopes" do
    context "::with_max_voters" do
      subject { described_class.with_max_voters }

      let!(:vote_candidate_with_max_voters) { create(:vote_candidate, voters_count: 2) }

      before do
        create_list(:vote_candidate, 2, voters_count: 1)
      end

      it "returns AR::Relation with candidates which have max voters count" do
        expect(subject).to contain_exactly(vote_candidate_with_max_voters)
      end
    end
  end
end
