module Roles
  module Neutrals
    class Outcast < Neutral
      def wakes_up_at_night?; false; end

      def win_condition
        dead? && received_vote_actions.approved.exists?
      end
    end
  end
end

# Изгой - нейтрал.
# Побеждает если будет выгнан на голосовании.
