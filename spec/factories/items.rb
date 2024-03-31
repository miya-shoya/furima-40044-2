FactoryBot.define do
  factory :item do
    association :user

    name { Faker::Name.initials(number: 2) }
    price { 1000 }
    info { 'aaaa' }
    category_id { 1 }
    situation_id { 1 }
    cost_id { 1 }
    region_id { 1 }
    delivery_day_id { 1 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/hero.jpg'), filename: 'hero.jpg')
    end
  end
end
