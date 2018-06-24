require 'rails_helper'

describe 'homepage' do

  let(:user) { FactoryBot.create(:user)}
  let!(:submitted_post) { FactoryBot.create(:post, status: 'submitted') }
  let!(:unsubmitted_post) { FactoryBot.create(:post, user: user) }

  describe 'Admin Features' do
    let(:admin_user) { FactoryBot.create(:admin_user) }
    before do
      login_as admin_user
      visit root_path
    end

    it 'allows admin to approve posts from homepage' do
      click_on "approve_#{submitted_post.id}"
      expect(submitted_post.reload.status).to eq('approved')
    end
  end

  describe 'Employee features' do

    let!(:audit_log) { FactoryBot.create(:audit_log, user: user) }
    before do
      login_as user
      visit root_path
    end
    it 'allows employee to submit posts from homepage' do
      click_on "submit_post_#{unsubmitted_post.id}"
      expect(unsubmitted_post.reload.status).to eq('submitted')
    end

    xit 'allows employeed to confirm weekly overtime' do
      click_on "confirm_audit_log_#{audit_log.id}"
      expect(audit_log.reload.status).to eq('confirmed')
    end
  end


end