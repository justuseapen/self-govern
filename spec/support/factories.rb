FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "fake#{n}@real.com"
    end
    password 'passw0rd'
    password_confirmation 'passw0rd'

    trait :curator do
      curator true
    end

    factory :curator, traits: [:curator]
  end

  factory :prompt do
    sequence :text do |n|
      "Is #{n} the best number?"
    end
    user
  end

  factory :choice do
    sequence :text do |n|
      "Choice #{n}"
    end
    user
    prompt
  end
end
