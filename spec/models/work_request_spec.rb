require 'rails_helper'

describe WorkRequest, type: :model do
  describe 'confirms validations of workrequest model' do
    describe '.validations' do
      it { should validate_presence_of(:scheme_name) }
      it { should validate_presence_of(:submission_date) }
      it { should validate_presence_of(:report_date) }
      it { should validate_presence_of(:issue_method) }
      it { should validate_presence_of(:project_type) }
      it { should validate_presence_of(:office) }

    end
  end
end
