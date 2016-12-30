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

  def show
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.find(params[:id])
  end

  def destroy
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.find(params[:id])
    @contact.delete
    redirect_to company_path(@company)
  end

  def edit
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.update(params[:id], contact_params)
    redirect_to company_contact_path(@company, @contact)
  end

  private 

  def contact_params
    params.require(:contact).permit(:name, :position, :email, :notes)
  end
end
