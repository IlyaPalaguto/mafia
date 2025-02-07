module Roles
  module Neutrals
    class Lovers < Neutral

      MIN_PLAYERS_FOR_VICTORY = 4

      REQUIRED_INVIULNERABILITY_ACTIVATIONS = 3

      def win_condition
        lovers = game_session.players.where(role: self.class)

        # Как то так наверно
        return true if game_session.players.count <= MIN_PLAYERS_FOR_VICTORY

        Badges::AvoidMurder.where(player: lovers).count >= REQUIRED_INVIULNERABILITY_ACTIVATIONS
      end
    end
  end
end

# Любовники - нейтралы, парная роль, 2 человека просыпаются на знакомстве. Каждую ночь ведущий называет их роль, они не просыпаются, но могут поднимать руку, если они оба поднимают руки одновременно, то получают неуязвимость на эту ночь, это не озвучивается никому, даже им, изначально, это можно сделать лишь однажды, однако, проголосовав вдвоем за одного и того же игрока на дневном голосовании получают ещё одну возможность активировать неуязвимость. Если умирает один из них, то умирают оба.
# Побеждают оставшись в числе 4 последних выживших, либо спасшись от выстрелов трижды за игру.
