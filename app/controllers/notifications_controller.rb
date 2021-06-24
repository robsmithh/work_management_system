class NotificationsController < ApplicationController

  def index
    if current_user.analyst?
      @notifications = Notification.where(analyst_notification: true, viewed: false)
    else
      @notifications = Notification.where(user_id: current_user.id, viewed: false)
    end
  end

  def update
    @notification = Notification.find(params[:id])
    @notification.viewed = true
    if @notification.save
      redirect_to work_request_path(@notification.work_request_id)
    else
      flash[:alert] = "An error has occured"
      redirect_to work_request_path(@notification.work_request_id)
    end
  end
end
