require 'tools'

class PageSetup

  include Tools

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

  def header_alljobs_index
    header = init_hash(false)
    header[:title] = "List of All Jobs"
    return header
  end

  def set_header(route)
    return header_dashboard_index if route == :dashboard_index
    return header_alljobs_index if route == :alljobs_index
  end

  def form(route)
    return init_hash(false)
  end

end