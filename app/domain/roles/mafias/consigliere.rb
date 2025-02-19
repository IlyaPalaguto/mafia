module Roles
  module Mafias
    class Consigliere < Mafia
      def move_order
        Constants::MOVE_ORDER[:MAFIA]
      end

      def wakes_up_at_night?; false; end
      # Пока оставим, чет сложно пока
      def use_ability(params)
        target = players.find(params[:target_id]).update(role: Roles::Mafia)
      end
    end
  end
end

# Консильери - мафия, один раз за игру вместо ночного убийства мафии МОЖЕТ завербовать одного игрока, роль игрока меняется на роль мафия, не имеющую никаких особых действий, когда завербованный игрок проснется, ведущий жестом покажет ему что он теперь играет за мафию. При проверках завербованный игрок будет показан не присутствующей в игре ролью мафии.
