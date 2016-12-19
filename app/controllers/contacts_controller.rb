class ContactsController < ApplicationController

  def index
    @company =found_company
  end

  def show

    @company =found_company
    @contact = @company.contacts.find(params[:id])

    render :show
  end

  def new
    @company = found_company
    @contact = Contact.new
  end

  def create
    @company = found_company
    if @company.contacts.create(contact_params)
      redirect_to company_contacts_path(@company)
    else
      render :new
    end
  end


  def edit
    @company = found_company
    @contact = @company.contacts.find(params[:id])
  end

  def update
    @company = found_company
    @contact = @company.contacts.find(params[:id])
    if @contact.update(contact_params)
      redirect_to company_contact_path(@company, @contact)
    else
      render :edit
    end
  end

  def destroy
    Contact.find(params[:id]).destroy
    redirect_to company_contacts_path(found_company)
  end

  def found_company
     Company.find(params[:company_id])
  end

  private
  def contact_params
    params.require(:contact).permit(:name,:position,:email)
  end
end
