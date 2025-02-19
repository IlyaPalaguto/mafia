class Action < ApplicationRecord
  belongs_to :night, optional: true
  belongs_to :actionable, polymorphic: true
  belongs_to :target, class_name: "Player", optional: true

  enum status: [:pending, :approved, :rejected]
end
