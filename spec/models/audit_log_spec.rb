require 'rails_helper'

RSpec.describe AuditLog, type: :model do

  let(:audit_log) { FactoryBot.create(:audit_log) }

  describe 'creation' do
    it 'can be created' do
      expect(audit_log).to be_valid
    end
  end

  describe 'validations' do
    it 'should have user associate with it' do
      expect(audit_log.user).to be_a_kind_of(User)
    end

    it 'should have a start date' do
      audit_log.start_date = nil
      expect(audit_log).to_not be_valid
    end

    it 'should have a start date 6 days prior' do
      expect(audit_log.start_date).to eq(Date.today - 6.days)
    end

    it 'should have a status' do
      audit_log.status = nil
      expect(audit_log).to_not be_valid
    end
  end
end
