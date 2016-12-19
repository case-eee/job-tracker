module ApplicationHelper

  def time_parse(date)
    date.strftime("%a, %d %b %Y")
  end

  def sort_parse(item)
    if item.class == String
      Job.where(city: item)
    else
      Job.where(level_of_interest: item)
    end
  end

end
