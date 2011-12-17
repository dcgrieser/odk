require 'spec_helper'

describe User do
  context "Converting student to faculty" do
    let (:student) { Factory.create(:student) }
    it "fails without a title" do
      student.title = nil
      student.type = User::FACULTY
      student.should_not be_valid
    end

    it "succeeds with a title" do
      student.title = "super awesome"
      student.type = User::FACULTY
      student.should be_valid
    end
  end

  describe "#admin?" do
    let (:student) { Factory.create(:student) }
    it "returns true if the user is a current officer" do
      role = Factory.create(:role, :user_id => student.id, :term_start_year => Date.today.year)
      student.admin?.should be_true
    end

    it "returns false if the user is not an officer" do
      student.admin?.should be_false
    end
    it "returns false if the user is a past officer" do
      role = Factory.create(:role, :user_id => student.id, :term_start_year => Date.today.year - 2)
      student.admin?.should be_false
    end
  end

  context "scopes" do
    describe "tappees" do
      before do
        @tappees = []
        @initiated = []
        @tappees << Factory.create(:student, :active => false, :initiation_date => nil)
        @tappees << Factory.create(:student, :active => false, :initiation_date => nil)
        @initiated << Factory.create(:student, :initiation_date => Date.new(2011, 2))
        @initiated << Factory.create(:student, :initiation_date => Date.new(2011, 2))
      end

      it "finds the tappees" do
        tappees = User.tappees
        tappees.size.should == @tappees.size
        @tappees.each do |u|
          tappees.should include u
        end
      end
    end

    describe "initiated" do
      before do
        @tappees = []
        @initiated = []
        @tappees << Factory.create(:student, :active => false, :initiation_date => nil)
        @tappees << Factory.create(:student, :active => false, :initiation_date => nil)
        @initiated << Factory.create(:student, :initiation_date => Date.new(2011, 2))
        @initiated << Factory.create(:student, :initiation_date => Date.new(2011, 2))
      end

      it "finds initated members" do
        initiated = User.initiated
        initiated.size.should == @initiated.size
        @initiated.each do |u|
          initiated.should include u
        end
      end
    end

    describe "current" do
      before do
        @current = []
        @past = []
        @current << Factory.create(:student, :active => true)
        @current << Factory.create(:student, :active => true)
        @past << Factory.create(:student, :active => false)
        @past << Factory.create(:student, :active => false)
      end

      it "finds current members" do
        current_members = User.current
        current_members.size.should == @current.size
        current_members.each do |u|
          @current.should include(u)
        end
      end
    end

    describe "current_officers" do
      before do
        @current_officers = []
        Role::TITLES.each do |title|
          u = Factory.create(:student)
          Factory.create(:role, :term_start_year => 2010, :title => title, :user_id => u.id)
          @current_officers << u
        end
        @past_officer = Factory.create(:student)
        Factory.create(:role, :term_start_year => 2009, :user_id => @past_officer.id)
      end

      it "returns the current officers" do
        current_officers = User.current_officers
        current_officers.size.should == @current_officers.size
        current_officers.each do |u|
          @current_officers.should include(u)
        end
      end
    end
  end

  describe "#newest_role" do
    it "returns the latest role" do
      officer = Factory.create(:student)
      role_2 = Factory.create(:role, :user_id => officer.id, :term_start_year => 2011)
      role_1 = Factory.create(:role, :user_id => officer.id, :term_start_year => 2009)
      officer.newest_role.should == role_2
    end

    it "returns nil if no roles" do
      officer = Factory.create(:student)
      officer.newest_role.should be_nil
    end
  end
end
