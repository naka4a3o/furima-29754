require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @user_order = FactoryBot.build(:user_order, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_order).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @user_order.postal_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_order.postal_code = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'item_prefecture_idを選択していないと保存できないこと' do
      @user_order.item_prefecture_id = 0
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Item prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @user_order.city = nil
      @user_order.valid?

      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberは空では保存できないこと' do
      @user_order.house_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("House number can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @user_order.building_name = nil
      expect(@user_order).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberはハイフンは不要で、11桁を超過すると保存できないこと' do
      @user_order.phone_number = '090-1234-5678'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Phone number is not a number')
    end
    it 'tokenが空では登録できないこと' do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
