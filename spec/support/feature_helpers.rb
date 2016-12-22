module FeatureHelpers
  def logged_as_user
    user = create(:user)
    page.set_rack_session(user_id: user.id)
  end

  def create_cities_and_visit_cities
    create_list(:city,5)
    visit("/cities")
  end

  def visit_new_city_path_and_create_new_city
    visit("/cities/new")
    fill_in("Name", with: "Denver")
    fill_in("State", with: "Colorado")
    click_button("Create")
  end

  def create_city_and_visit_edit_city_path
    city = create(:city)
    visit edit_city_path(city)
  end

  def create_cities_with_jobs
    city = create(:city)
    city.jobs << create_list(:job,5)
    city
  end

  def create_jobs_with_comments
    job = create(:job)
    job.comments << create_list(:comment, 5)
    job
  end

  def visit_new_comment_path_and_create_comment
    @job = create(:job)
    visit(new_company_job_comment_path(@job.company, @job))
    fill_in "comment[content]", with: "Maybe not!"
    click_on("Create Comment")
  end

  def visit_edit_comment_path
    create_list(:comment, 5)
    job = Comment.first.job
    company = job.company
    visit(company_job_comments_path(company,job))
    click_on("Edit")
  end
end
