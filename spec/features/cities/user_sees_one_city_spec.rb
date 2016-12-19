require 'rails_helper'

describe "city #show" do
  before do
    FactoryGirl.reload
    @city = create(:city)
    @city.jobs << create_list(:job,5)
    visit(city_path(@city))
  end

  it "the user should see all jobs associated with that city" do
    @city.jobs.each do |job|
      within ".city" do
        expect(page.body).to have_content(job.title)
      end
    end
  end

  it "the page should also have links to the jobs show page" do
    @city.jobs.each do |job|
      within ".city" do
        expect(page.body).to have_link(job.company.name)
      end
    end
  end

end
