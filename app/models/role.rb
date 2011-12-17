class Role < ActiveRecord::Base
  TITLES = ["President", "Vice President for Selections", "Vice President for Events", "Treasurer", "Secretary", "Historian", "Faculty Secretary"]

  belongs_to :user

  validates :user_id, :presence => true,
    :uniqueness => { :scope => :term_start_year }
  validates :title, :inclusion => { :in => TITLES },
    :uniqueness => { :scope => :term_start_year }
  validates :term_start_year,
    :presence => true,
    :numericality => true,
    :format => { :with => /\d{4}/ }

  def self.current
    current_year = order("term_start_year desc").limit(1).first.try(:term_start_year)
    where(:term_start_year => current_year)
  end
end
