class Player < ApplicationRecord
  class RoleSerializer
    def self.load(val)
      val&.constantize
    end

    def self.dump(obj)
      obj.name
    end
  end

  enum status: [:alive, :dead, :pending]

  # with_unique_roles prevent to select both "Lovers"
  scope :with_unique_roles, -> { where(id: select('MIN(id) as id').group(:role)) }
  scope :civilians,         -> { where(role: Roles::Constants::CIVILIAN_ROLES) }
  scope :neutrals,          -> { where(role: Roles::Constants::NEUTRAL_ROLES) }
  scope :mafias,            -> { where(role: Roles::Constants::MAFIA_ROLES) }
  scope :not_civilians,     -> { mafias.or(neutrals) }

  belongs_to :game_session

  has_many :actions, as: :actionable
  has_many :select_actions, -> { where(type: "Actions::Select") }, class_name: "Action", as: :actionable
  has_many :guess_actions,  -> { where(type: "Actions::Guess") },  class_name: "Action", as: :actionable
  has_many :check_actions,  -> { where(type: "Actions::Check") },  class_name: "Action", as: :actionable
  has_many :save_actions,   -> { where(type: "Actions::Save") },   class_name: "Action", as: :actionable
  has_many :kill_actions,   -> { where(type: "Actions::Kill") },   class_name: "Action", as: :actionable

  has_many :received_actions, through: :targeted, source: :action
  has_many :received_ability_block_actions, -> { where(type: "Actions::AbilityBlock") }, through: :targeted, source: :action
  has_many :received_save_actions,          -> { where(type: "Actions::Save") },         through: :targeted, source: :action

  has_and_belongs_to_many :voted_candidates, class_name: "VoteCandidate", join_table: "players_vote_candidates"

  serialize :role, coder: RoleSerializer

  delegate :mafia?,
           :neutral?,
           :civilian?,
           :any_saves?,
           :move_order,
           :use_ability,
           :wakes_up_at_night?, to: :role

  def role
    @role ||= super&.new(game_session:, player: self)
  end
end
