require 'spec_helper'

describe ApplicationHelper do
  describe '#current_semester' do
    it "returns Spring for January" do
      Timecop.freeze(Date.new(2011, 1)) do
        current_semester.should == "Spring"
      end
    end

    it "returns Fall for August" do
      Timecop.freeze(Date.new(2011, 8)) do
        current_semester.should == "Fall"
      end
    end
  end
end
