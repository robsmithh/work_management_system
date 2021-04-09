class ContactsController < ApplicationController

  def contact; end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.find(params[:id])
    @contact.save(params.require(:contact).permit(:first_name, :last_name, :email, :phone_number, :job_role))
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(params.require(:contact).permit(:first_name, :last_name, :email, :phone_number, :job_role))
    redirect_to contact_path
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contact_path
  end
end
