class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    @company = Company.find(params[:company_id])
    @contact.company_id = @company.id
    if @contact.save
      flash[:success] = "Contact saved!"
      redirect_to company_path(@company)
    else
      flash[:notice] = "Contact not saved"
      redirect_to company_path(@company)
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end
end
