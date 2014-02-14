FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "fake#{n}@real.com"
    end
    password 'passw0rd'
    password_confirmation 'passw0rd'
    confirmed_at DateTime.now

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

  factory :comment do
    sequence :text do |n|
      "This is my ##{n} favorite prompt!!!!111!11"
    end
    user
    prompt
  end
end
