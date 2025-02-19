module Roles
  module Mafias
    class Lobbyist < Mafia

      def move_order
        Constants::MOVE_ORDER[:MAFIA]
      end

      def use_ability(params)
        ability_block_actions.create(target_id: params[:target_id], night: active_night)
      end

    end
  end
end

# Лоббист - мафия, отменяет ночные способности (в том числе неуязвимость Священника или любовников) игрока. Всегда просыпается первый.
