module Roles
  module Mafias
    class Boss < Mafia
      def move_order
        Constants::MOVE_ORDER[:MAFIA]
      end

      def use_ability(params)
        debuff_actions.create(target_id: params[:debuff_target_id], night: active_night)

        return nil
      end

    end
  end
end

# Босс мафии - мафия, выбирает игрока, за него на голосовании изначально будет один голос. Это не озвучивается изначально.
