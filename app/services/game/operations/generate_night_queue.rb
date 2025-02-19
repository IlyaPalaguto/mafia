module Game::Operations
  class GenerateNightQueue
    class << self
      def call(players:, night:)
        queue = players.not_dead.with_unique_roles.load.to_a

        if queue.any?(&:mafia?)
          mafia_turn = MafiaTurn.new(players: queue.select(&:mafia?))
          queue << mafia_turn unless night.mafia_action.present?
        end

        queue.select!(&:wakes_up_at_night?)
        queue.sort_by!(&:move_order)

        queue - night.completed_players.distinct
      end
    end
  end
end
