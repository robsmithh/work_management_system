require 'rails_helper'

describe DataSubmission, type: :model do
  describe 'confirms validations of workrequest model' do
    describe '.validations' do
      it { should validate_presence_of(:data_location).on(:update) }
      it { should validate_presence_of(:source_data).on(:update) }
      it { should validate_presence_of(:working_data).on(:update) }
      it { should validate_presence_of(:final_data).on(:update) }
      it { should validate_presence_of(:manipulation_summary).on(:update) }
      it { should validate_presence_of(:data_spec).on(:update) }
      it { should validate_presence_of(:duplicate_members).on(:update) }
    end
  end
end
