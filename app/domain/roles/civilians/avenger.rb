module Roles
  module Civilians
    class Avenger < Civilian
      def move_order
        Constants::MOVE_ORDER[:CIVILIAN_KILLING_ROLES]
      end

      def use_ability(params)
        params[:select_target_ids].each do |target_id|
          select_actions.create(night: active_night, target_id:)
        end

        kill_actions.pending.each do |action|
          unless params[:kill_target_ids].present?
            action.target_id = params[:kill_target_ids].shift
            action.night = active_night

            attempt_to_kill(action)
          end
        end

        return nil
      end

      def check_ability
        select_actions.pending.each do |action|
          if action.target.dead?
            action.approve!
            kill_actions.create
          else
            action.reject!
          end
        end

        shoots_count

        super
      end

      def shoots_count
        @shoots_count ||= kill_actions.pending.count
      end
    end
  end
end

# Мститель - мирный, ночью указывает на 2 людей если любой из них умрет до его следующего ночного действия (за эту ночь, и игровой день), получает возможность выстрела. За каждого угаданного выстрел дается отдельно, выстрелы накапливаются. Выстрел, производится до определения следующих целей мстителя, не заменяет ночной выбор, а дополняет его.
