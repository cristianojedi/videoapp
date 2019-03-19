FactoryBot.define do
  factory :video do
    name { Faker::DcComics.title }
    url  { Faker::Internet.url }
    user
  end
end
