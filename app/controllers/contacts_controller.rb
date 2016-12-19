class ContactsController < ApplicationController


  def create
    contact = Contact.new(contact_params)
    @company = Company.find(params[:company_id])
    @contact = @company.contacts 
    if @contact.save
      redirect_to company_jobs_path(@company)
    else
      render :new
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:full_name, :email, :position, :company_id)
    end
end
