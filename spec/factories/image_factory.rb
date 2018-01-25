FactoryBot.define do
  factory :image do
    source_url { Faker::Internet.url }
    url { Faker::Internet.url }
    sourcelink

    trait :invalid do
      source_url "test"
      url "test"
    end

    factory :invalid_image, traits: [:invalid]
  end
end
