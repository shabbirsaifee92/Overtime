require 'rails_helper'

describe 'navigation' do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of Posts only created by the same user' do
      post1 = FactoryBot.create(:post, user: @user)
      post2 = FactoryBot.create(:second_post, user: @user)
      unauthorized_user = FactoryBot.create(:unauthorized_user)

      FactoryBot.create(:post, rationale: 'content from other user', user: unauthorized_user)

      visit posts_path

      expect(page).to have_content(/rationale|content/)
      expect(page).to_not have_content(/content from other user/)
    end

  end

  describe 'new' do
    it 'has link from homepage' do
      visit root_path
      click_link('new_post_tab')
      expect(page.status_code).to eq(200)
    end

  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some rationale'

      click_on 'Save'

      expect(page).to have_content('Some rationale')
    end

    it 'will have a user associated' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User Association'

      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq('User Association')
    end
  end

  describe 'edit' do
    before do
      @post = FactoryBot.create(:post, user: @user)
    end

    it 'can be reached by clicking edit on index page' do
      visit posts_path
      click_link "edit-post-#{@post.id}"
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(@post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited Content'

      click_on 'Save'

      expect(page).to have_content('Edited Content')
    end

    it 'cannot be edited by a non authorized user' do
      logout :user
      unauthorized_user = FactoryBot.create(:unauthorized_user)
      login_as unauthorized_user

      visit edit_post_path(@post)

      expect(current_path).to eq(root_path)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      post = FactoryBot.create(:post, user: @user)
      visit posts_path

      click_link("delete-post-#{post.id}")
      expect(page.status_code).to eq(200)
    end
  end
end