class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :title, :initiation_date, :type, :active
  has_secure_password

  STUDENT = 'Student'
  FACULTY = 'Faculty'
  TYPES = [STUDENT, FACULTY]

  has_many :roles, :dependent => :destroy

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :type, :inclusion => { :in => TYPES}, :allow_nil => true
  validates :title, :presence => true, :if => :faculty?

  def self.tappees
    where(:initiation_date => nil).order(:last_name)
  end

  def self.current
    where(:active => true).order(:last_name)
  end

  def self.initiated
    where("initiation_date IS NOT NULL").order(:initiation_date => :desc, :last_name => :desc)
  end

  def self.current_officers
    joins(:roles).merge(Role.current)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def newest_role
    roles.order(:term_start_year => :desc).limit(1).first
  end

  def student?
    type == STUDENT
  end

  def faculty?
    type == FACULTY
  end

  def admin?
    role = roles.order(:term_start_year).first
    return unless role
    return role.term_start_year.to_i >= Date.today.year - 1
  end
end
