module Roles
  module Neutrals
    class Maniac < Neutral

      MIN_PLAYERS_FOR_VICTORY = 3

      def move_order
        Constants::MOVE_ORDER[:NEUTRAL_KILLING_ROLES]
      end

      def use_ability(params)
        action = check_actions.create(target_id: params[:target_id], night: active_night, status: :approved)

        case action.target.role
        when Roles::Mafia
          kill_actions.create

          result = {
            show_status: :thumb_down
          }
          return result
        when Roles::Civilian
          boost_actions.create

          status = {
            show_status: :thumb_down
          }
          return status
        when Roles::Neutral
          result = {
            show_role: action.target.role
          }

          return result
        end
      end

      def win_condition
        game_session.players.alive.count <= MIN_PLAYERS_FOR_VICTORY
      end
    end
  end
end

# Маньяк - нейтрал, ночью указывает игрока игрока, если роль игрока:
# Мирный - получает двойной голос на голосовании.
# Нейтрал - узнает точную роль своей цели
# Мафия - следующей ночью получает возможность выстрела (нельзя стрелять в того кого он проверял прошлой ночью). Выстрелы не копятся.
# Побеждает оставшись одним из 3 последних игроков.
