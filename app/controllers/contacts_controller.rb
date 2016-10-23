require_relative '../helpers/contact_helper'

class ContactsController < ApplicationController

  def create
    @contact, @company = ContactHelper.get_params(params, contact_params)

    if @contact.save
      flash[:success] = "Contact added!"
    else
      flash[:error] = "Information missing"
    end

    redirect_to company_jobs_path(@company)
  end


  private

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email)
  end

end
