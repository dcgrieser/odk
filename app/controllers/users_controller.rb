class UsersController < ApplicationController
  def index
    @tappees  = User.tappees
    @current_students = Student.current
    @current_faculty  = Faculty.current
    @students = Student.initiated
    @faculty  = Faculty.initiated
  end

  def officers
  end
end
