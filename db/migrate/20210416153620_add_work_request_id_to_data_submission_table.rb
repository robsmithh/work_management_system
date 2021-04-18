class AddWorkRequestIdToDataSubmissionTable < ActiveRecord::Migration[6.1]
  def change
    add_column :data_submissions, :work_request_id, :int
  end
end
