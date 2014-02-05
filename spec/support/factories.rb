FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "fake#{n}@real.com"
    end
    password 'passw0rd'
    password_confirmation 'passw0rd'
  end

  factory :prompt do
    sequence :text do |n|
      "Is #{n} the best number?"
    end

    user
  end
end
