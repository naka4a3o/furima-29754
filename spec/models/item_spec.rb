require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品情報の保存' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end
    it 'userが紐付いていないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空では保存できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'descriptionが空では保存できないこと' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'categoryを選択していないと保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it 'item_statusを選択していないと保存できないこと' do
      @item.item_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Item status must be other than 1')
    end
    it 'shipping_bearerを選択していないと保存できないこと' do
      @item.shipping_bearer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping bearer must be other than 1')
    end
    it 'item_prefectureを選択していないと保存できないこと' do
      @item.item_prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Item prefecture must be other than 0')
    end
    it 'scheduled_deliveryを選択していないと保存できないこと' do
      @item.scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Scheduled delivery must be other than 1')
    end
    it 'priceが空では保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが、¥300未満では保存できないこと' do
      @item.price = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
    it 'priceが、¥9,999,999を超過すると保存できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
    it 'priceが半角数字でなければ保存できない' do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
  end
end
