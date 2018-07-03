require 'rails_helper'

describe 'navigate' do

  let!(:user) { FactoryBot.create(:user) }
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:post) { FactoryBot.create(:post, user: user) }

  before do
    login_as admin_user, scope: :user
  end

  describe 'edit' do
    before do
      visit edit_post_path(post)
    end

    it 'has a status that can be edited on the form by an admin' do
      choose 'post_status_approved'

      click_on 'Save'

      expect(post.reload.status).to eq('approved')
    end

    it 'cannot be edited by non admin' do
      logout :user
      user = FactoryBot.create(:user)

      login_as user, scope: :user

      visit edit_post_path(post)
      expect(current_path).to eq(root_path)
    end

    it 'cannot be edited by the creator once the post is approved ' do

      logout(:user)
      post.update_attribute(:status, 'approved')
      login_as(user)

      visit  edit_post_path(post)

      expect(current_path).to eq(root_path)
    end
  end
end