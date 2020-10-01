FactoryBot.define do
  factory :item do
    name                     { '本' }
    description              { '文庫本です' }
    category_id              { 2 }
    item_status_id           { 2 }
    price                    { 500 }
    shipping_bearer_id       { 3 }
    item_prefecture_id       { 4 }
    scheduled_delivery_id    { 5 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
