require 'spec_helper'

describe User do
  context "Converting student to faculty" do
    let (:student) { Factory.create(:student) }
    it "fails without a title" do
      student.title = nil
      student.type = Student::FACULTY
      student.should_not be_valid
    end

    it "succeeds with a title" do
      student.title = "super awesome"
      student.type = Student::FACULTY
      student.should be_valid
    end
  end

  describe "#admin?" do
    let (:student) { Factory.create(:student) }
    it "returns true if the user is a current officer" do
      role = Factory.create(:role, :user_id => student.id, :term_start_year => Date.today.year)
      student.admin?.should be_true
    end

    it "returns false if the user is not a current officer" do
      student.admin?.should be_false
    end
    it "returns false if the user is a past officer" do
      role = Factory.create(:role, :user_id => student.id, :term_start_year => Date.today.year - 2)
      student.admin?.should be_false
    end
  end
end
