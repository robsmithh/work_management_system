class WorkRequest < ApplicationRecord
  belongs_to :user

  validates :scheme_name, :submission_date, :report_date, :issue_method, :project_type, :office, presence: true

end
