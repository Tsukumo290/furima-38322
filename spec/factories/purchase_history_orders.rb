FactoryBot.define do
  factory :purchase_history_order do
    post_code               { '111-1111' }
    prefecture_id           { 1 }
    municipality            { '北海道' }
    address                 { '知床' }
    phone_number            { '09012345678' }
    token                   { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end