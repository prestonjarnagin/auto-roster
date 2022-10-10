class Inning < ApplicationRecord
  belongs_to :game

  enum half: {
    top: 0,
    bottom: 1
  }
end
