class ContactsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contact = @company.contacts.new(contact_params)
    if @contact.save
      flash[:success] = "#{@contact.name} successfully created!"
      redirect_to company_jobs_path(@company)
    else
      @contacts = @company.contacts
      @errors = @contact.errors
      render "jobs/index"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end
end