class AddStatusToWorkRequest < ActiveRecord::Migration[6.1]
  def change
    add_column :work_requests, :status, :string
  end
end
