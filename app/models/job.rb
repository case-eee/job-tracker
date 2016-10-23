class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true

  belongs_to :company
  belongs_to :category
  has_many :comments
  has_many :jobs_tags
  has_many :tags, through: :jobs_tags

  def sorted_comments
    comments.order(created_at: :desc)
  end

  def self.sorted_interests
    order(level_of_interest: :desc)
  end

  def self.job_count
    group(:level_of_interest).order('count_id desc').count('id')
  end

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |title| Tag.find_or_create_by(title: title) }
    self.tags = new_or_found_tags
  end

end
