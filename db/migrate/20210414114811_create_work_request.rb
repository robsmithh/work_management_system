class CreateWorkRequest < ActiveRecord::Migration[6.1]
  def change
    create_table :work_requests do |t|
      t.string "scheme_name"
      t.date "submission_date"
      t.date "report_date"
      t.string "issue_method"
      t.string "project_type"
      t.string "office"
      t.timestamps
    end
  end
end
