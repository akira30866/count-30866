FactoryBot.define do
  factory :count do
    name        { "カウント" }
    remark      { "テスト" }
    trials      { 10 }
    category_id { 2 }
    release_id  { 2 }

    association :user
    after(:build) do |img|
      img.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
