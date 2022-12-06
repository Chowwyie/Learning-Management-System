# frozen_string_literal: true

##
# Helper utility functions that are related to the User controller
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
