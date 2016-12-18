module ControllerHelper
    
  def sort_by(attribute, list)
    if attribute.eql? "location"
      list.order(:city)
    elsif attribute.eql? "interest"
      list.order('level_of_interest DESC')
    elsif attribute.eql? "company"
      list.order(:company_id)
    else
      list
    end
  end

  def list
    if @location
      Job.where(city: @location)
    elsif @category
      @category.jobs
    else
      set_company.jobs
    end
  end

  def format_interest
    low    = 0
    medium = 0
    high   = 0
    counts = Job.all.group(:level_of_interest).count
    count_parser(counts, low, medium, high)
  end

  def count_parser(counts, low, medium, high)
    counts.each do |interest, count|
      if (0..40).include? interest
        low += count
      elsif (41..79).include? interest
        medium += count
      else
        high += count
      end
    hash_maker(low, medium, high)
    end
  end

  def hash_maker(low, medium, high)
    @interest_levels = Hash.new(0)
    @interest_levels[:low] += low
    @interest_levels[:medium] += medium
    @interest_levels[:high] += high
    @interest_levels
  end

  def format_interest_averages
    calculate_average_interest.sort_by { |name, interest| interest }.reverse[0..2]
  end

  def calculate_average_interest
    average_interest = {}
    Company.all.each do |company|
      average_interest[company.name] = company.jobs.average(:level_of_interest).to_i
    end
    average_interest
  end
end