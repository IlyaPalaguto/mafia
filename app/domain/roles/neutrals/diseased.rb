module Roles
  module Neutrals
    class Diseased < Neutral

      def use_ability(params)
        select_actions.create(target_id: params[:target_id], night: active_night, status: :approved)

        return nil
      end

      def win_condition
        # TODO: check it in sql if it's possible or just optimize that request
        players.alive.includes(:received_actions).all? { _1.received_actions.find_by(player:) || _1 == player }
      end
    end
  end
end

# Больной - нейтрал, ночью указывает на одного игрока, тем самым заражая его.
# Побеждает если за столом остались только больной и заражённые игроки.
