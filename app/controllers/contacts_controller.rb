class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:contact][:company_id]
    @contact.save
    redirect_to company_jobs_path(@contact.company)
   end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email, :company_id)
  end
end
