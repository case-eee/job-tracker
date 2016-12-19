require 'rails_helper'

describe "When a user visits a company page" do
  before do
    category1 = Category.create(title: "Business")
    category2 = Category.create(title: "Finance")
    @company = Company.create(name: "RockTenn")
    @job1 = @company.jobs.create(title: "CEO",
                                description: "The boss.",
                                level_of_interest: 2,
                                city: "Denver",
                                category_id: "#{category1.id}")
    @job2 = @company.jobs.create(title: "Accountant",
                                description: "Manage taxes",
                                level_of_interest: 2,
                                city: "Denver",
                                category_id: "#{category2.id}")
    @contact1 = @company.contacts.create(first_name: "Jane",
                                          last_name: "Doe",
                                          position: "CEO",
                                          email: "jane@company.com")
    @contact2 = @company.contacts.create(first_name: "John",
                                          last_name: "Smith",
                                          position: "HR Manager",
                                          email: "john@company.com")
    visit company_path(@company)
  end

  it "they see the company and its jobs and contacts" do
    expect(page).to have_content("RockTenn")
    expect(page).to have_content("CEO")
    expect(page).to have_content("Accountant")
    expect(page).to have_content("Jane Doe")
    expect(page).to have_content("John Smith")
  end

  it "they see the individual job when they click on the title" do
    click_on "Accountant"

    expect(current_path).to eql(company_job_path(@company, @job2))
    expect(page).to have_content("RockTenn")
    expect(page).to have_content("Accountant")
  end

  it "they see the individual contact when they click on the name" do
    click_on "Jane Doe"

    expect(current_path).to eql(company_contact_path(@company, @contact1))
    expect(page).to have_content("Jane Doe")
  end
end
