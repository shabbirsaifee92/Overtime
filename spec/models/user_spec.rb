require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build_stubbed(:user)
  end

  describe 'creation' do
    it 'can be created' do
      expect(@user).to be_valid
    end

    it 'cannot be created without first_name , last_name' do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe 'validations' do
    it 'requires phone number only to have numbers' do
      @user.phone_number = 'mygreatstr'
      expect(@user).to_not be_valid
    end

    it 'requires the phone to be only 10 chars' do
      @user.phone_number = '12345678901'
      expect(@user).to_not be_valid
    end
  end

  describe 'custom name methods' do
    it 'has a full name method to retun full name' do
      expect(@user.full_name).to eq('Jon Snow')
    end
  end

  describe 'relationship between managers and employees' do
    it 'allows managers to be associated with multiple employees' do
      manager = FactoryBot.create(:manager)
      employee = FactoryBot.create(:user, manager_id: manager.id)
      # employee1.update_attribute(:manager_id, manager.id)
      # binding.pry
      expect(employee.manager_id).to eq(manager.id)
    end
  end
end
