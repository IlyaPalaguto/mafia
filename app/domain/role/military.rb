module Role
  module Military
    extend Role::Selectable
    include Role

    ROLES = [
      Role::Military::Doctor,
      Role::Military::Psychic,
      Role::Military::Detective,
      Role::Military::Priest,
      Role::Military::Judge,
      Role::Military::Journalist,
      Role::Military::Paranoid,
      Role::Military::Avenger,
      Role::Military::Sheriff,
      Role::Military::Gravedigger
    ]
  end
end
