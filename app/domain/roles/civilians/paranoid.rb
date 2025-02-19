module Roles
  module Civilians
    class Paranoid < Civilian
      # TODO: не понятно пока как будить параноика
      def use_ability(params)
        guess_actions.create(target_id: params[:guess_target_id], nigjht: active_night )
      end

      def wakes_up_at_night?; false; end
    end
  end
end

# Параноик - мирный, если в него стреляют ночью, ведущий подаёт звуковой сигнал, после чего игрок имеет право открыть глаза, игрок указывает на другого игрока, если этот игрок был причастен к его убийству, то параноик выживает.
