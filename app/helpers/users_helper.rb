# frozen_string_literal: true

module UsersHelper
  def student_list
    users = User.all
    students = []
    users.each do |user|
      students << user unless user.admin
    end
    students
  end
end
