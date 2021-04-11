require 'rails_helper'

describe User, type: :model do

  describe 'confirms validations for user model' do
    describe '.validations' do
      it { should validate_presence_of(:username) }
      it { should validate_presence_of(:email) }
      # it { should validate_presence_of(:password) }
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }

      it { should allow_value('test_user').for(:username) }
      it { should allow_value('test_user@example.com').for(:email) }
      # it { should allow_value('password').for(:password) }
      it { should allow_value('first').for(:first_name) }
      it { should allow_value('last').for(:last_name) }

      it { should_not allow_value('').for(:username) }
      it { should_not allow_value('a' * 4).for(:username) }
      it { should_not allow_value('a' * 31).for(:username) }

      it { should_not allow_value('').for(:email) }
      it { should_not allow_value('test_user@email.com.').for(:email) }
      it { should_not allow_value('test_user@email.').for(:email) }
      it { should_not allow_value('test_useremail.com.').for(:email) }

      # it { should_not allow_value('').for(:password) }

      it { should_not allow_value('').for(:first_name) }
      it { should_not allow_value('1').for(:first_name) }

      it { should_not allow_value('').for(:last_name) }
      it { should_not allow_value('1').for(:last_name) }

    end
  end
end
