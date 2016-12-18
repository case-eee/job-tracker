class ContactsController < ApplicationController
  before_action :set_company

  def create
    @contact = @company.contacts.new(contact_params)
    @contact.save
    redirect_to company_jobs_path(@company)
  end

  def destroy
    Contact.find(params[:id]).destroy
    flash[:deleted] = "That contact has been destroyed forever in the fires of Mt. Doom." 
    redirect_to company_jobs_path(@company)
  end

private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email, :company_id)
  end
end 