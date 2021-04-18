class CreateDataSubmission < ActiveRecord::Migration[6.1]
  def change
    create_table :data_submissions do |t|
      t.date :actual_submission_date
      t.string :data_location
      t.string :source_data
      t.string :working_data
      t.string :final_data
      t.string :manipulation_summary
      t.string :data_spec
      t.string :duplicate_members
      t.timestamps
    end
  end
end
