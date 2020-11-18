FactoryBot.define do
  factory :detail do
    title       { "テスト" }
    number      { 2 }
    probability { 10 }
    association :count
  end
end
