class AddFieldsToNotification < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :time_viewed, :datetime
    add_column :notifications, :viewed, :boolean, default: false
    add_column :notifications, :added_by, :integer
    add_column :notifications, :message, :text
    add_column :notifications, :analyst_notification, :boolean, default: false
  end
end
