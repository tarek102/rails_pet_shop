require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it 'checks if name is empty' do
      user = User.new(email: 'tarek@gmail.com', password: '123456')
      expect(user.valid?).to eq false
    end

    it 'checks if name is present' do
      user = User.new(name: 'test', email: 'test@gmail.com', password: '123456')
      expect(user.valid?).to eq true
    end

    it 'name should not be too long' do
      user = User.new(name: 'a' * 60, email: 'test@gmail.com', password: '123456')
      expect(user).to_not be_valid
    end

    it 'name should not be too long' do
      user = User.new(name: 'test', email: 'test@gmail.com', password: '1234')
      expect(user).to_not be_valid
    end
  end
end