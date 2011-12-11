class User < ActiveRecord::Base
  has_secure_password

  has_many :roles

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true

  def name
    "#{first_name} #{last_name}"
  end
end
