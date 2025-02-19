class MafiaTurn
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :players
  attribute :role, default: Roles::Mafia.new

  delegate :move_order, :wakes_up_at_night?, to: :role
end
