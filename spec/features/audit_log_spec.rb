require 'rails_helper'

describe 'AuditLog feature' do

  let!(:audit_log) { FactoryBot.create(:audit_log) }
  let(:admin_user) { FactoryBot.build(:admin_user) }
  let(:user) { FactoryBot.build(:user) }

  before do
    login_as admin_user
  end

  it ' has an index page that can be reached' do
    visit audit_logs_path
    expect(page.status_code).to eq(200)
  end

  it 'renders audit log content' do
    visit audit_logs_path
    expect(page).to have_content(/SNOW, JON/)
  end

  it 'cannot be accessed by non admin users' do
    logout admin_user
    login_as user

    visit audit_logs_path
    expect(current_path).to eq(root_path)
  end
end