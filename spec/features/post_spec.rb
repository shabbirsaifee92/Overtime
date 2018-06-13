require 'rails_helper'

describe 'navigation' do
  
  let!(:user) { FactoryBot.create(:user) }

  let!(:post) { FactoryBot.create(:post, user: user) }

  before do
    login_as(user, :scope => :user)
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
      post1 = FactoryBot.create(:post, user: user)
      post2 = FactoryBot.create(:second_post, user: user)
      another_user = FactoryBot.create(:another_user)

      FactoryBot.create(:post, rationale: 'content from other user', user: another_user)

      visit posts_path

      expect(page).to have_content(/rationale|second post content/)
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
      fill_in 'post[hours]', with: 0.5
      expect { click_on 'Save' }.to change(Post, :count).by(1)

    end

    it 'will have a user associated' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User Association'

      click_on 'Save'

      expect(post.user).to eq(user)
    end
  end

  describe 'edit' do

    it 'can be reached by clicking edit on index page' do
      visit posts_path
      click_link "edit-post-#{post.id}"
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited Content'

      click_on 'Save'

      expect(page).to have_content('Edited Content')
    end

    it 'cannot be edited by a non authorized user' do
      logout :user
      another_user = FactoryBot.build(:another_user)
      login_as another_user

      visit edit_post_path(post)

      expect(current_path).to eq(root_path)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      visit posts_path

      click_link("delete-post-#{post.id}")
      expect(page.status_code).to eq(200)
    end
  end
end