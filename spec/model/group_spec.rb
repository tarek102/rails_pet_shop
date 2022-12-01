require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:example) do
    @user = User.create(name: 'tarek', email: 'tarek@test.com', password: '123456')
  end

  context 'Validations' do
    it 'checks for name and icon presence' do
      group = Group.new(author: @user, name: 'Travel', icon: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png')
      expect(group.valid?).to eq true
    end

    it 'checks for name presence' do
      group = Group.new(author: @user, icon: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png')
      expect(group.valid?).to eq false
    end

    it 'checks for icon presence' do
      group = Group.new(author: @user, name: 'Travel')
      expect(group.valid?).to eq false
    end
  end
end
