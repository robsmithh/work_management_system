class ApplicationController < ActionController::Base
  before_action :aa_count
  before_action :analyst_notifications
  before_action :my_notifications

  def aa_count
    @aa_count = WorkRequest.where(status: "Awaiting Approval").count
  end

  def analyst_notifications
    @analyst_notifications = Notification.where(analyst_notification: true, viewed: false).count
  end

  def my_notifications
    if current_user
      @my_notifications = Notification.where(user_id: current_user.id, viewed: false).count
    end
  end

  def new_notification(work_request, analyst_notification)
    n = Notification.create(user_id: work_request.user.id, work_request_id: work_request.id, analyst_notification: analyst_notification)
    n.save
  end
end
