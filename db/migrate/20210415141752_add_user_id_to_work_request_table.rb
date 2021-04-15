class AddUserIdToWorkRequestTable < ActiveRecord::Migration[6.1]
  def change
    add_column :work_requests, :user_id, :int
  end
end
