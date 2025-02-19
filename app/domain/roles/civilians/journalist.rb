module Roles
  module Civilians
    class Journalist < Civilian

      def use_ability(params)
        params[:target_ids].each do |target_id|
          check_actions.create(target_id:, night: active_night, status: :approved)
        end

        # TODO: рефактор этот ужас
        roles = players.where(id: params[:target_ids]).pluck(:role)
        result = {}

        result[:show_check_result] = if roles.all?(&:mafia?) || roles.all?(&:civilian) || roles.map(&:name).uniq.count != roles.count
          true
        else
          false
        end
      end
    end
  end
end

# Журналист - мирный, указывает ночью в 2 людей, если они играют на одной стороне то получает положительную проверка, иначе, отрицательную, любая проверка в которой присутствует хотя бы 1 нейтральный персонаж даст отрицательный результат.
