module Roles
  module Neutrals
    class Lovers < Neutral

      MIN_PLAYERS_FOR_VICTORY = 4

      REQUIRED_INVIULNERABILITY_ACTIVATIONS = 3

      def move_order
        Constants::MOVE_ORDER[:SAVING_ROLES]
      end

      def use_ability(params)
        status = params[:success] ? :pending : :rejected

        lovers.each { _1.save_actions.create(target: _1, status:, night: active_night) }
      end

      def check_ability
        # Нужно додумать
        lovers.joins(:voted_candidates)

        super
      end

      def win_condition
        return true if players.count <= MIN_PLAYERS_FOR_VICTORY

        Actions::Kill.where(target: lovers, status: :rejected).count >= REQUIRED_INVIULNERABILITY_ACTIVATIONS
      end

      private

      def lovers
        @lovers ||= players.where(role: self.class)
      end
    end
  end
end

# Любовники - нейтралы, парная роль, 2 человека просыпаются на знакомстве. Каждую ночь ведущий называет их роль, они не просыпаются, но могут поднимать руку, если они оба поднимают руки одновременно, то получают неуязвимость на эту ночь, это не озвучивается никому, даже им, изначально, это можно сделать лишь однажды, однако, проголосовав вдвоем за одного и того же игрока на дневном голосовании получают ещё одну возможность активировать неуязвимость. Если умирает один из них, то умирают оба.
# Побеждают оставшись в числе 4 последних выживших, либо спасшись от выстрелов трижды за игру.
