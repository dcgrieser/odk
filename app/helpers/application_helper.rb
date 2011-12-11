module ApplicationHelper
  def current_semester
    if Date.today.month > 7
      "Fall"
    else
      "Spring"
    end
  end
end
