class ContactsController < ApplicationController
  def new
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new
  end

  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new(contact_params)
    if @contact.save
      flash[:success] = "#{@contact.name} added!"
      redirect_to company_path(@company)
    else
      flash[:error] = "Please enter a real person"
      render :new
    end
  end

  private 

  def contact_params
    params.require(:contact).permit(:name, :position, :email, :notes)
  end
end
