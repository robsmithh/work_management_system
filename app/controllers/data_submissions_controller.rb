class DataSubmissionsController < ApplicationController

  def index; end

  def show
    @data_submission = DataSubmission.find(params[:id])
  end

  def edit
    @data_submission = DataSubmission.find(params[:id])
  end

  def update
    @data_submission = DataSubmission.find(params[:id])
    if @data_submission.update(params.require(:data_submission).permit(:data_location, :source_data,
         :working_data, :final_data, :manipulation_summary, :data_spec, :duplicate_members))
         @data_submission.work_request.status = "Data submitted"
         @data_submission.work_request.save
      flash[:notice] = "Data submitted successfully"
      redirect_to work_requests_path
    else
      render 'new'
    end
  end

  def destroy; end

end
