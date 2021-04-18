class WorkRequest < ApplicationRecord
  belongs_to :user
  has_one :data_submission

  validates :scheme_name, :submission_date, :report_date, :issue_method, :project_type, :office, :status, presence: true

end
