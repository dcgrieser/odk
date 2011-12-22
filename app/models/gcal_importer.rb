class GcalImporter
  # URL = "https://www.google.com/calendar/feeds/r8bj3t9k3id0c1s4qa7bjfamas%40group.calendar.google.com/public/full"
  URL = "http://www.google.com/calendar/feeds/developer-calendar@google.com/public/full"
  PARAMS = {
    "alt"          => "json",
    "orderby"      => "starttime",
    "max-results"  => "5",
    "singleevents" => "true",
    "sortorder"    => "ascending",
    "futureevents" => "true",
  }

  def self.get
    json = JSON.parse(RestClient.get(URL, {:accept => :json, :params => PARAMS}))
    new(json)
  end

  def initialize(json)
    @json = json
  end

  def each(&blk)
    entries.each do |entry|
      event = OpenStruct.new
      event.title = entry["title"]["$t"]
      event.text = entry["content"]["$t"]
      event.where = entry["gd$where"].first["valueString"]
      event.link = entry["link"].first["href"]
      event.when = OpenStruct.new
      event.when.start = Time.new(entry["gd$when"].first["startTime"])
      event.when.end = Time.new(entry["gd$when"].first["endTime"])
      yield event
    end
  end

  def size
    entries.size
  end

  protected
  def entries
    entries = @json["feed"]["entry"] || []
  end
end
