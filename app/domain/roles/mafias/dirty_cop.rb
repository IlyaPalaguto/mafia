module Roles
  module Mafias
    class DirtyCop < Mafia
      def move_order
        Constants::MOVE_ORDER[:MAFIA]
      end

      def wakes_up_at_night?; end; false
    end
  end
end

# Продажный коп - мафия, в ночь знакомства выбирает себе роль из присутствующих в игре, на проверках будет отображаться выбранной ролью, однако на проверках определяющих сторону должен быть показан как мафия.
