class PageSetup

  class << self; attr_accessor :header end

  def initialize(route)
    @header = set_header(route)
  end

  def header
    @header
  end

  def header_dashboard_index
    header = init_hash(false)
    header[:title] = "Job Tracker Dashboard"
    return header
  end

  def set_header(route)
    return header_dashboard_index if route == :dashboard_index
  end

  def form(route)
    return init_hash(false)
  end

  def init_hash(value)
    Hash.new(value)
  end

end