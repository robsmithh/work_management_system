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
    @work_request = WorkRequest.new(params.require(:work_request).permit(:scheme_name,
       :submission_date, :report_date, :issue_method, :project_type, :office))
    @work_request.user = current_user
    @work_request.status = "Awaiting Approval"
    if @work_request.save
      @work_request.data_submission = DataSubmission.create(work_request_id: @work_request.id)
      flash[:notice] = "Request successfully created"
      redirect_to work_requests_path
    else
      render 'new'
    end
  end

  def show
    @work_request = WorkRequest.find(params[:id])
    @note = Note.new
  end

  def edit
    @work_request = WorkRequest.find(params[:id])
  end

  def update
    @work_request = WorkRequest.find(params[:id])
  if @work_request.update(params.require(:work_request).permit(:status, :scheme_name,
      :submission_date, :report_date, :issue_method, :project_type, :office))
    flash[:notice] = "Request successfully amended"
    redirect_to work_requests_path
  else
     render 'edit'
  end
  end

  def awaiting_approval
    @work_requests = WorkRequest.where(request_approved: false)
  end

  def accept_request
    if current_user.analyst?
      @work_request = WorkRequest.find(params[:id])
      @work_request.request_approved = true
      @work_request.time_approved = DateTime.current
      @work_request.approved_by = Etc.getlogin
      @work_request.status = "Confirmed - awaiting submission"
      @work_request.update(params.permit(:request_approved, :time_approved, :approved_by, :status))
      flash[:notice] = "Request successfully confirmed"
      redirect_to awaiting_approval_path
    else
      flash[:alert] = "You do not have permission to access this page"
      redirect_to awaiting_approval_path
    end
  end

  def summary
    if current_user.analyst?
      @work_requests = WorkRequest.where(request_approved: true)
    else
      flash[:alert] = "You do not have permission to access this page"
      redirect_to root_path
    end
  end

  def destroy
    @work_request = WorkRequest.find(params[:id])
    @work_request.destroy
    flash[:notice] = "Request successfully withdrawn"
    redirect_to work_requests_path
  end
end
