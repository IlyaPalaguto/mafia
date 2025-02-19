module Roles
  module Mafias
    class Snitch < Mafia
      def move_order
        Constants::MOVE_ORDER[:MAFIA]
      end

      def use_ability(params)
        if params[:target_id].present?
          silence_actions.create(target: params[:target_id], night: active_night)
        else
          skip_actions.create(night: active_night)
        end
      end
    end
  end
end
