FactoryBot.define do
  factory :item do
    name             { 'hoge' }
    description      { 'hogehoge' }
    category_id      { 1 }
    condition_id     { 1 }
    postage_id       { 1 }
    prefecture_id    { 1 }
    shipping_date_id { 1 }
    price            { 300 }
    association :user
  end
end
