class Role
  include ActiveModel::Model

  attr_accessor :game_session, :player
  attr_reader :able_to_make_action

  delegate :active_night, to: :game_session

  delegate :actions,
           :kill_actions,
           :save_actions,
           :check_actions, to: :player

  def name
    self.class.name.split('::').last
  end

  def fraction
    self.class.name.split('::').second
  end

  def description
    "Должно быть описание в сабклассах каждой роли"
  end

  def use_ability(params)
    ability_params = AbilityParams.new(params)

    if block_given?
      yield(ability_params)
    else
      raise NotImplementedError, "This method should be implemented in subclasses"
    end
  end

  def check_ability
    @able_to_make_action ||= player.alive? && !player.received_ability_block_actions.pending.exists?
  end

  def win_condition
    raise NotImplementedError, "This method should be implemented in subclasses"
  end

  def move_order
    Constants::MOVE_ORDER[:OTHER]
  end

  def wakes_up_at_night?
    true
  end

  def any_saves?
    player&.received_save_actions.pending.exists?
  end

  def civilian?; false; end
  def mafia?; false; end
  def neutral?; false; end

  private

  def attempt_to_kill(action)
    if action.target.any_saves?
      action.rejected!
    else
      action.approved!
      action.target.pending!
    end
  end
end
