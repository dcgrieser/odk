class EventsController < ApplicationController
  def index
    @calendar_events = GcalImporter.get
    @events = Event.all
  end

  def show
  end
end
