require 'spec_helper'

describe Role do
  describe "validations" do
    let (:role) { Factory.create(:role) }

    it "requires a valid title" do
      role.title = 'Bad title'
      role.should_not be_valid
      role.errors[:title].should_not be_nil
    end

    it "requires a valid term start year" do
      role.term_start_year = 'foo'
      role.should_not be_valid
      role.errors[:term_start_year].should_not be_nil
    end

    it "requires a 4 digit term start year" do
      role.term_start_year = '09'
      role.should_not be_valid
      role.errors[:term_start_year].should_not be_empty
    end

    it "requires a unique title within a year" do
      year = role.term_start_year
      title = role.title
      role_2 = Factory.build(:role, :term_start_year => year, :title => title)
      role_2.should_not be_valid
      role_2.errors[:title].first.should match /already been taken/
    end

    it "requires a user can only have one role per year" do
      year = role.term_start_year
      user = role.user
      role_2 = Factory.build(:role, :term_start_year => year, :user => user)
      role_2.should_not be_valid
      role_2.errors[:user_id].first.should match /already been taken/
    end
  end
end
