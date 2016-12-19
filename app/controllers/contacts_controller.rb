class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:company_id]
    if @contact.save
      flash[:success] = "Created Contact!"
      redirect_to company_jobs_path(@contact.company)
    else
      redirect_to company_jobs_path(@contact.company)
    end
  end

  def new
    @company = Company.find(params[:id])
  end

  private
  def contact_params
    params.require(:contact).permit(:full_name, :position, :email, :company_id)
  end
 end
