class DataSubmission < ApplicationRecord
  belongs_to :work_request

  validates :data_location, :source_data, :working_data,:final_data, :manipulation_summary,
          :data_spec, :duplicate_members, presence: true, on: :update
end
