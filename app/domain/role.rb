module Role
  attr_reader :game_session, :player

  module Selectable
    def select_roles(quantity)
      self::ROLES.sample(quantity)
    end
  end

  def initialize(game_session=nil, player=nil)
    @game_session = game_session
    @player = player
  end

  def name
    self.class.name.split('::').last
  end

  def fraction
    self.class.name.split('::').second
  end

  def description
    "Должно быть описание в сабклассах каждой роли"
  end

  def ability
    raise NotImplementedError, "This method should be implemented in subclasses"
  end

  def win_condition
    raise NotImplementedError, "This method should be implemented in subclasses"
  end

  def military?; false; end
  def mafia?; false; end
  def neutral?; false; end
end
