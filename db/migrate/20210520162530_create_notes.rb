class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string 'note'
      t.string 'user_id'
      t.timestamps
      t.integer "work_request_id"
    end
  end
end
