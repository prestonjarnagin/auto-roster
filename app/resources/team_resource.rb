class TeamResource < JSONAPI::Resource
  has_many :players
  attributes :name
end
