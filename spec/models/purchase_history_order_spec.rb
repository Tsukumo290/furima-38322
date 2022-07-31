require 'rails_helper'

RSpec.describe PurchaseHistoryOrder, type: :model do
  before do
    @order = FactoryBot.build(:purchase_history_order)
  end

  describe '商品購入機能' do
    context '商品購入できる場合' do
      it '必須項目の入力をすれば購入できる' do
        expect(@order).to be_valid
      end
      it '建物名を入力しても購入できる' do
        @order.building_name = "半島"
        expect(@order).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'tokenが空では購入できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では購入できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_codeが空では購入できない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefecture_idが未選択では購入できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空では購入できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では購入できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'post_codeが「3桁ハイフン4桁」でないと購入できない' do
        @order.post_code = '1111-1111'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'post_codeが「3桁ハイフン4桁」の半角数値でないと購入できない' do
        @order.post_code = '１１１−１１１１'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'phone_numberが「10桁以上11桁以内」でないと購入できない' do
        @order.phone_number = '11111'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numberが「10桁以上11桁以内」の半角数値でないと購入できない' do
        @order.phone_number = '０９０１２３４５６７８'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
    end
  end
end
