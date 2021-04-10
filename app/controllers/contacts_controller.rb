class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params.require(:contact).permit(:first_name, :last_name, :email, :phone_number, :job_role))
    if @contact.save
      flash[:alert] = "Contact added successfully"
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(params.require(:contact).permit(:first_name, :last_name, :email, :phone_number, :job_role))
      flash[:alert] = "Contact updated successfully"
      redirect_to contacts_path
    else
      render 'edit'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:alert] = "Contact deleted successfully"
    redirect_to contacts_path
  end
end
