class WorkRequestsController < ApplicationController

  def index
    if current_user
      @user = User.find(current_user.id)
    else
      flash[:alert] = "You must be logged in to access this page"
      redirect_to 'root_path'
    end
  end

  def new
    @work_request = WorkRequest.new
  end

  def create
    @work_request = WorkRequest.new(params.require(:work_request).permit(:scheme_name, :submission_date, :report_date, :issue_method, :project_type, :office))
    @work_request.user = current_user
    @work_request.status = "Awaiting Approval"
    if @work_request.save
      @work_request.data_submission = DataSubmission.create(work_request_id: @work_request.id)
      flash[:notice] = "Request successfully created" #notice is a common type of alert. alert is the other type - usually for when something goes wrong.
      redirect_to work_requests_path
    else
      render 'new'
    end
  end

  def show
    @work_request = WorkRequest.find(params[:id])
  end

  def edit
    @work_request = WorkRequest.find(params[:id])
  end

  def update; end

  def destroy
    @work_request = WorkRequest.find(params[:id])
    @work_request.destroy
    redirect_to work_requests_path
  end
end
