class AddWrId < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :work_request_id, :integer
  end
end
