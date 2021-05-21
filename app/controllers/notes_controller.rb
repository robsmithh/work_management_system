class NotesController < ApplicationController

  def create
    @note = Note.new(params.require(:note).permit(:note))
    @note.work_request_id = params[:wr_id]
    @note.user_id = current_user.email
    if params[:note][:note] == ''
      redirect_to work_request_path(@note.work_request_id)
    elsif @note.save
      redirect_to work_request_path(@note.work_request_id)
    else
      flash[:alert] = "Note can't be blank"
    end
  end
end
