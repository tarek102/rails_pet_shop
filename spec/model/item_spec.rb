require 'rails_helper'

RSpec.describe Item, type: :model do
  before(:example) do
    @user = User.create(name: 'tarek', email: 'tarek@gmail.com', password: '123456')
    @group = Group.new(author: @user, name: 'test', icon: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png')
  end

  context 'Validations' do
    it 'checks for name presence' do
      item = Item.new(author: @user, amount: 123, group_ids: [@group.id])
      expect(item.valid?).to eq false
    end

    it 'checks for amount presence' do
      item = Item.new(author: @user, name: 'Cool', group_ids: [@group.id])
      expect(item.valid?).to eq false
    end
  end
end