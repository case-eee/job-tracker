require 'tools'

class PageSetup

  include Tools

  class << self; attr_accessor :header, :form end

  def initialize(route)
    @header = set_header(route)
    @form = set_form(route)
  end

  def header
    @header
  end

  def form
    @form
  end

  def header_dashboard_index(header)
    # header = init_hash(false)
    header[:title] = "Job Tracker Dashboard"
    return header
  end

  def header_alljobs_index(header)
    # header = init_hash(false)
    header[:title] = "List of All Jobs"
    return header
  end

  def header_jobs_index(header)
    # header = init_hash(false)
    header[:title] = "List of Available Jobs at "
    header[:show_add] = true
    header[:show_name] = true
    header[:show_company_index] = true
    return header
  end

  def header_jobs_new(header)
    # header = init_hash(false)
    header[:title] = "Add a New Job at "
    header[:show_index] = true
    header[:show_name] = true
    return header
  end

  def header_jobs_show(header)
    # header = init_hash(true)
    header[:title] = "Details for "
    header[:show_add] = false
    header[:show_company_index] = false
    return header
  end

  def header_jobs_edit(header)
    # header = init_hash(false)
    header[:title] = "Edit Job Details"
    header[:show_index] = true
    header[:show_job] = true
    header[:show_name] = true
    return header
  end

  def set_header(route)
    return header_dashboard_index(init_hash(false)) if route == :dashboard_index
    return header_alljobs_index(init_hash(false)) if route == :alljobs_index
    return header_jobs_index(init_hash(false)) if route == :jobs_index
    return header_jobs_new(init_hash(false)) if route == :jobs_new
    return header_jobs_show(init_hash(true)) if route == :jobs_show
    return header_jobs_edit(init_hash(false)) if route == :jobs_edit
  end

  def form_jobs_new(form)
    # form = init_hash("")
    form[:submit] = "Save Job"
    form[:show_categories] = true
    return form
  end

  def form_jobs_show(form)
    # form = init_hash("")
    form[:submit_comment] = "Save Comment"
    return form
  end

  def form_jobs_edit(form)
    # form = init_hash("")
    form[:submit] = "Update Job Details"
    form[:show_categories] = true
    return form
  end

  def set_form(route)
    return form_jobs_new(init_hash("")) if route == :jobs_new
    return form_jobs_show(init_hash("")) if route == :jobs_show
    return form_jobs_edit(init_hash("")) if route == :jobs_edit
  end

end