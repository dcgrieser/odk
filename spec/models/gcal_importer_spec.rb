require "spec_helper"

describe GcalImporter do
  let (:resp) { File.read(Rails.root.join("spec", "fixtures", "gcal.json")) }
  let (:gcal_importer) do
    RestClient.stub(:get).and_return(resp)
    GcalImporter.get
  end

  describe "::get" do
    it "returns an instance of GcalImporter" do
      gcal_importer.should be_kind_of(GcalImporter)
    end
  end

  describe "::each" do
    it "yields 5 times with arguments" do
      idx = 0
      expected = [
        {"title" => "App Engine Chat Time", "text" => "Super awesome fun time"},
        {"title" => "San Diego Android Developer Group", "text" => "Paul Carff talking about Google TV"},
        {"title" => "App Engine Chat Time", "text" => "Super awesome fun time"},
        {"title" => "Auckland GTUG", "text" => "Ankur will speak on Android"},
        {"title" => "App Engine Chat Time", "text" => "Super awesome fun time"},
      ]

      gcal_importer.each do |event|
        event.title.should == expected[idx]["title"]
        event.text.should == expected[idx]["text"]
        idx += 1
      end
    end
  end

  describe "::size" do
    it "returns the number of events" do
      gcal_importer
      gcal_importer.size.should == 5
    end
  end
end
