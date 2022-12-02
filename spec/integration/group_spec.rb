require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'index page' do
    before(:example) do
      @user = User.create(name: 'tarek', email: 'tarek@mail.com', password: '123456')
      @group = Group.create(author: @user, name: 'test', icon: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png')
    end

    it 'checks if name is present' do
      group = Group.new(author: @user, name: 'test', icon: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png')
      expect(group.valid?).to eq true
    end

    it 'checks if there is no name' do
      group = Group.new(author: @user, icon: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png')
      expect(group.valid?).to eq false
    end

    it 'checks if icon is present' do
      group = Group.new(author: @user, name: 'test', icon: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png')
      expect(group.valid?).to eq true
    end

    it 'checks if icon is empty' do
      group = Group.new(author: @user, name: 'test')
      expect(group.valid?).to eq false
    end

    it 'title should not be too long' do
      group = Group.new(author: @user, name: 'a' * 260, icon: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png')
      expect(group).to_not be_valid
    end
  end
end
