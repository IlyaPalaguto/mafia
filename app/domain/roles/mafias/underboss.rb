module Roles
  module Mafias
    class Underboss < Mafia
      def move_order
        Constants::MOVE_ORDER[:MAFIA]
      end

      def use_ability(params)
        action = check_actions.create(target_id: params[:target_id], night: active_night, status: :approved)

        result = {
          show_role: action.target.role
        }

        return result
      end
    end
  end
end

# Андербосс - мафия, указывает на человека и узнает его роль, свое действие совершает после встречи мафии.
