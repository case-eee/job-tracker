class ContactsController < ApplicationController

  def create
    @contact = Contact.create(params[:contact])

   redirect_to company_jobs_path(@company)
  end

  private
    def contact_params
      params.require(:contact).permit(:full_name, :email, :position, :company_id)
    end
end
