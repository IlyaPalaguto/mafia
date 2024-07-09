module Role
  module Selectable
    def select_roles(quantity)
      self::ROLES.sample(quantity)
    end
  end

  def ability
    raise NotImplementedError, "This method should be implemented in subclasses"
  end

  def win_condition
    raise NotImplementedError, "This method should be implemented in subclasses"
  end
end
