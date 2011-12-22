class EventImage < ActiveRecord::Base
  image_accessor :image

  belongs_to :event

  validates :event, :presence => true
  validates :image, :presence => true
  validates_property :format, :of => :image, :in => [:jpg, :jpeg, :png]
end
