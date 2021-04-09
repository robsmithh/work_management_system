require 'rails_helper'

describe Contact, type: :model do

  describe 'confirms validations for article model' do
    describe '.validations' do
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:phone_number) }
      it { should validate_presence_of(:job_role) }

      it { should allow_value('aa').for(:first_name) }
      it { should allow_value('a' * 34).for(:first_name) }
      it { should_not allow_value('a').for(:first_name) }

      it { should allow_value('aa').for(:last_name) }
      it { should allow_value('a' * 34).for(:last_name) }
      it { should_not allow_value('a').for(:last_name) }

      it { should allow_value('test_user@example.com').for(:email) }
      it { should allow_value('test_user@example.co.uk').for(:email) }
      it {should_not allow_value('test_user@example.com.').for(:email) }
      it { should_not allow_value('test_user@example.'). for(:email) }
      it { should_not allow_value('test_user@example').for(:email) }
      it { should_not allow_value('textuser@').for(:email) }

      it { should allow_value('aa').for(:job_role) }
      it { should allow_value('a' * 34).for(:job_role) }
      it { should_not allow_value('a').for(:job_role) }
    end
  end


end
