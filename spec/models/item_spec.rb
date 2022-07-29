require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/star.png')
  end

  describe '商品出品機能' do
    context '商品出品できる場合' do
      it '全ての項目の入力が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない場合' do
      # 入力欄が空の場合のバリデーション検証

      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが未選択では出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが未選択では出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'postage_idが未選択では出品できない' do
        @item.postage_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it 'prefecture_idが未選択では出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_date_idが未選択では出品できない' do
        @item.shipping_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      # priceのバリデーション検証

      it 'priceが全角数字だと出品できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price out of setting range')
      end
      it 'priceが299円以下と出品できない' do
        @item.price = 290
        @item.valid?
        expect(@item.errors.full_messages).to include('Price out of setting range')
      end
      it 'priceが10,000,000以上だと出品できない' do
        @item.price = 10, 0o00, 0o00
        @item.valid?
        expect(@item.errors.full_messages).to include('Price out of setting range')
      end

      # name, descriptionのバリデーション検証
      it 'nameが41文字以上だと出品できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'descriptionが1,001文字以上だと出品できない' do
        @item.description = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
      end

      #アソシエーションの確認

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    
    end
  end
end
