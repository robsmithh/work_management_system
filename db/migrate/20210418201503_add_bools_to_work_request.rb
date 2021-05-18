class AddBoolsToWorkRequest < ActiveRecord::Migration[6.1]
  def change
    add_column :work_requests, :request_approved, :boolean, default: false
    add_column :work_requests, :time_approved, :datetime
    add_column :work_requests, :approved_by, :string
  end
end
