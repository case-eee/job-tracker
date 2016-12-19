class ContactsController < ApplicationController
  before_action :set_company
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = @company.contacts
    render('companies/show')
  end

  def new
    @contact = @company.contacts.new
  end

  def create
    @contact = @company.contacts.create(contact_params)
    if @contact.save
      flash[:success] = "You created a contact for #{@contact.first_name} #{@contact.last_name} at #{@company.name}"
      redirect_to company_contact_path(@company, @contact)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to company_contact_path(@company, @contact)
    else
      render :edit
    end
  end

  def destroy
    @contact.delete
    redirect_to company_path(@company)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :position, :email)
  end
end
