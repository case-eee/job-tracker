class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:company_id]
    @company = @contact.company
    if @contact.save
      flash[:success] = "You created a new contact!"
      redirect_to company_jobs_path(@company)
    else
      render :new
    end
  end



  private

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email)
  end
end
