require 'rails_helper'

describe 'homepage' do
  let(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:post) { FactoryBot.create(:post, status: 'submitted') }

  before do
    login_as admin_user
    visit root_path
  end

  it 'allows admin to approve posts' do
    click_on "approve_#{post.id}"
    expect(post.reload.status).to eq('approved')
  end
end