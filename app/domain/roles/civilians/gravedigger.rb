module Roles
  module Civilians
    class Gravedigger < Civilian
      def use_ability(params)
        target = players.find(params[:select_target_id])

        action = select_actions.create(target:, night: active_night, status: :approved)

        result = {
          show_roles: []
        }

        case target.received_kill_actions.approved.first.actionable_type
        when :player
          result[:show_roles] << target.received_kill_actions.approved.first.actionable.role
          result[:show_roles] << players.excluding(target.received_kill_actions.approved.first.actionable.role).sample
        when :night
          result[:show_roles] << mafias.sample.role
          result[:show_roles] << not_mafias.sample.role
        end

        return result
      end
    end
  end
end

# Могильщик - мирный, ночью указывает на игрока погибшего ночью, ведущий указывает ему на одного человека гарантированно причастного к убийству, и одного гарантированно не причастного.
