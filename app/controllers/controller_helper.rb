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
      @company.jobs
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
      if (0..50).include? interest
        low += count
      elsif (51..79).include? interest
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
end