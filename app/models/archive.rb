class Archive < ActiveRecord::Base
  image_accessor :file

  validates :title, :presence => true
  validates :file, :presence => true
end
