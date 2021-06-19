module UsersHelper
    def checked(area)
        @user.role.nil? ? false : @user.role.match(area)
    end
end
