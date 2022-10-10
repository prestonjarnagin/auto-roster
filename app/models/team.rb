class Team < ApplicationRecord
  # Validate uniq of slug
  after_create :generate_slug!
  has_many :players

  def generate_slug!
    until slug
      possible_slug = SecureRandom.hex(3)

      break if Team.find_by(slug: possible_slug)

      update!(slug: possible_slug)
    end
  end
end
