class Role
  include ActiveModel::Model

  attr_accessor :game_session, :player

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

  def civilian?; false; end
  def mafia?; false; end
  def neutral?; false; end
end
