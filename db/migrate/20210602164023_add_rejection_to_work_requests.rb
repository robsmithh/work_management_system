class AddRejectionToWorkRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :work_requests, :request_rejected, :boolean, defaul: false
    add_column :work_requests, :time_rejected, :datetime
    add_column :work_requests, :rejected_by, :string
  end
end
