FactoryBot.define do
  factory :player do
    name { Faker::Sports::Football.team }
    team
  end
end
