require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:post) { FactoryBot.create(:post)}

  describe 'creation' do

    it 'can be created' do
      expect(post).to be_valid
    end

    it 'cannot be created without a date and rationale and hours' do
      post.date = nil
      post.rationale = nil
      post.hours = nil
      expect(post).to_not be_valid
    end

    it 'cannot be created when overtime hours <= 0.0' do
      post.hours = 0.0
      expect(post).to_not be_valid
    end
  end
end
