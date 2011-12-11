require 'spec_helper'

describe User do
  context 'Converting student to faculty' do
    it 'fails without a title' do
      student = Factory.create(:student)
      student.title = nil
      student.type = Student::FACULTY
      student.should_not be_valid
    end

    it 'succeeds with a title' do
      student = Factory.create(:student)
      student.title = "super awesome"
      student.type = Student::FACULTY
      student.should be_valid
    end
  end
end
