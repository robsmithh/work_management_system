class ChangeRejectionDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :work_requests, :request_rejected, false
  end
end
