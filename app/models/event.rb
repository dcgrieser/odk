class Event < ActiveRecord::Base
  has_many :event_images

  validates :title, :presence => true
  validates :date, :presence => true
end
