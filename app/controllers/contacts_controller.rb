class ContactsController < ApplicationController

  def create 
    @company = Company.find(params[:company_id])
    @contact = Contact.new(contact_params)
    @contact.company_id = @company.id
    if @contact.save
      redirect_to company_path(@company)
    else
      @contact.errors.full_messages
      render :"jobs/index"
    end
  end

  private 

  def contact_params
    params.require(:contact).permit(:full_name, :email, :position, :company_id)
  end

end