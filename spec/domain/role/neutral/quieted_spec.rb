require 'rails_helper'

RSpec.describe Role::Neutral::Quieted do
  subject { create(:player, role: described_class).role }

  describe "#win_condition" do
    context "Quieted won" do
      before do
        votes = create_list(:vote, 4, game_session: subject.game_session)

        create(:vote_candidate, vote: votes.sort_by(&:created_at).first, candidate: subject.player )
      end

      it "returns true" do
        expect(subject.win_condition).to be_truthy
      end
    end

    context "Quited hadn't won yet" do
      context "when votes < 3" do
        before do
          create_list(:vote, 2, game_session: subject.game_session)
        end

        it "returns false" do
          expect(subject.win_condition).to be_falsey
        end
      end

      context "when he was a vote candidate" do
        before do
          votes = create_list(:vote, 3, game_session: subject.game_session)
          create(:vote_candidate, vote: votes.last, candidate: subject.player)
        end

        it "returns false" do
          expect(subject.win_condition).to be_falsey
        end
      end
    end
  end
end

# Тихоня - нейтрал, если на дневном голосовании в него не поднялось ни одной руки, получает возможность выстрела, выстрелы накапливаются.
# Побеждает если три дня подряд в него не подниматься ни одна рука.
