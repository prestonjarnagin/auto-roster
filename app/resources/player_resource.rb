class PlayerResource < JSONAPI::Resource
  has_one :team
  attributes :name
end
