class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true

  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :jobs_tags, dependent: :destroy
  has_many :tags, through: :jobs_tags, dependent: :destroy

  def self.sorted_interests
    order(level_of_interest: :desc)
  end

  def self.job_count
    group(:level_of_interest).order('count_id desc').count('id')
  end

  def sorted_comments
    comments.order(created_at: :desc)
  end

  def tag_list
    self.tags.collect do |tag|
      tag.title
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|string| string.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |title| Tag.find_or_create_by(title: title) }
    self.tags = new_or_found_tags
  end

  def get_category
    self.category.nil? ? category = '' : category = self.category.title
  end

end
