class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:company_id]
    @company = @contact.company

    if @contact.save
      flash[:success] = "Contact added!"
    else
      flash[:error] = "Information missing"
    end

    redirect_to company_jobs_path(@company)
  end


  private

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email)
  end

end
