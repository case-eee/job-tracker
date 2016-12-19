class ContactsController < ApplicationController
  def create
    @company = Company.find(params[:company_id])
    @contact = Contact.new(contact_params)
    @contact.company = @company
    if @contact.save
      redirect_to company_path(@company)
    else
      @errors = @contact.errors.full_messages
      # @company = Company.find(params[:id])
      @job_count = @company.jobs.count
      @company_contacts = @company.contacts
      @contact_count = @company_contacts.count
      @header = header(:companies_show)
      @form = form(:companies_show)
      render "companies/show"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end

    def header_companies_show
    header = init_hash(true)
    header[:title] = "Details for "
    header[:show_add] = false
    return header
  end

  def header(route)
    return header_companies_show if route == :companies_show
  end

  def form_companies_show
    form = init_hash("")
    form[:submit_contact] = "Save Contact"
    return form
  end

  def form(route)
    return form_companies_show if route == :companies_show
  end

  def init_hash(value)
    Hash.new(value)
  end

end