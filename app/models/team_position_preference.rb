class TeamPositionPreference < ApplicationRecord
  belongs_to :player
  belongs_to :team

  enum position: %i[
    pitcher
    catcher
    first_base
    second_base
    third_base
    short_stop
    left_field
    left_center
    right_field
    right_center
  ]
end
