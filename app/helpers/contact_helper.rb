module ContactHelper
  extend self

  def get_params(params, contact_params)
    contact = Contact.new(contact_params)
    contact.company_id = params[:company_id]
    company = contact.company

    [contact, company]
  end
end
