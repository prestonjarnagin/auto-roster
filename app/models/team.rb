class Team < ApplicationRecord
  # Validate uniq of slug
  after_create :generate_slug!
  has_many :players

end
