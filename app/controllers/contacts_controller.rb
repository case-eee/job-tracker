class ContactsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new(contact_params)
    @contact.save
    flash[:success] = "You added #{@contact.full_name} at #{@company.name} as a contact"
    redirect_to company_jobs_path(@company)
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email, :company_id)
  end

end
