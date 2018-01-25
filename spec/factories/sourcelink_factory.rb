FactoryBot.define do
  factory :sourcelink do
    url { Faker::Internet.url }

    trait :invalid do
      url "test"
    end

    transient do
      images_count 5
    end

    after(:create) do |sourcelink, evaluator|
      create_list(:image, evaluator.images_count, sourcelink: sourcelink)
    end

    factory :invalid_sourcelink, traits: [:invalid]
  end
end

