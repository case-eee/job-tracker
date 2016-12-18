class ContactsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @contacts = @company.contacts
    render('companies/show')
  end

  def new
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new
  end

  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.create(contact_params)
    if @contact.save
      flash[:success] = "You created a contact for #{@contact.first_name} #{@contact.last_name} at #{@company.name}"
      redirect_to company_contact_path(@company, @contact)
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:company_id])
    @contact = Contact.find(params[:id])
  end

  def edit
    @company = Company.find(params[:company_id])
    @contact = Contact.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to company_contact_path(@company, @contact)
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @contact = Contact.find( params[:id] )
    @contact.delete
    redirect_to company_path(@company)
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :position, :email)
  end
end
