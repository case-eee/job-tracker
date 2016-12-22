class ContactsController < ApplicationController
  
  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:company_id]
    if @contact.save
      flash[:success] = "You created the contact #{@contact.full_name} at #{@contact.company.name}"
      redirect_to company_path(@contact.company)
    else
      @errors = @contact.errors.full_messages
    end

  end

  private
    def contact_params
      params.require(:contact).permit(:full_name, :email, :position, :company_id)
    end
end
