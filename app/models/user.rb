class User < ActiveRecord::Base
  STUDENT = 'Student'
  FACULTY = 'Faculty'
  TYPES = [STUDENT, FACULTY]

  attr_accessible :first_name, :last_name, :email, :title, :initiation_date, :type, :active

  has_secure_password

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
    where("initiation_date IS NOT NULL").order(:initiation_date => :desc)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def student?
    type == STUDENT
  end

  def faculty?
    type == FACULTY
  end
end
