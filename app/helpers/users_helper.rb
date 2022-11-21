module UsersHelper
    def studentList
        users = User.all
        students = []
        users.each do |user|
            if !user.admin
                students << user
            end
        end
        students
    end
end
