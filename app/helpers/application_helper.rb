module ApplicationHelper
  GuessFraction = Struct.new(:role, :icon) do; end

  def array_to_guess
    [GuessFraction.new(Roles::Mafia, render("icons/thumb_down")), GuessFraction.new(Roles::Civilian, render("icons/thumb_up")), GuessFraction.new(Roles::Neutral, render("icons/shoot"))]
  end
end
