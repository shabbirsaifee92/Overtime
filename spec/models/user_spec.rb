require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
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

    it 'requires ssn' do
      @user.ssn = nil
      expect(@user).to_not be_valid
    end

    it 'requires company name' do
      @user.company = nil
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

  describe 'user relationships' do
    it { should respond_to(:followed_users) }
    it { should respond_to(:following?) }
    it { should respond_to(:follow!) }
    it { should respond_to(:unfollow!) }
    it { should respond_to(:followers) }
    it { should respond_to(:reverse_relationships) }

    context 'following and followed' do
      let(:other_user) { FactoryBot.create(:user) }
      before do
        @user.follow!(other_user)
      end

      it 'should be following other_user' do
        expect(@user.following?(other_user)).to be(true)
        expect(@user.followed_users).to include(other_user)
      end

      it 'should have other_user as follower' do
        expect(other_user.followers).to include(@user)
      end
    end
  end
end
