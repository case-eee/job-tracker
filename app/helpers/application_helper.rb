module ApplicationHelper

  def time_parse(date)
    date.strftime("%a, %d %b %Y")
  end

end
