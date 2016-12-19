class ContactsController < ApplicationController
  def create
    company = Company.find(params[:company][:id])
    @contact = Contact.new(contact_params)
    @contact.company_id = company.id
    if @contact.save
      redirect_to company_path(company)
    else
      redirect_to company_path(company)
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    company = @contact.company
    @contact.destroy
    flash[:success] = "Contact was successfully deleted!"
    redirect_to company_path(company)
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :position, :email)
  end
end
