package com.bv.fn.accounts

class ProfileController {

    def index() {}

    def update(UserCO userCO) {
        User user = User.loggedInUser
        userCO.user = user
        if (userCO.validate()) {
            user.email = userCO.email
            if (userCO.newPassword && user.validatePassword(userCO.oldPassword)) {
                user.password = userCO.newPassword
            }
            flash.message = "Profile updated successfully."
            redirect(action: 'index')
        } else {
            render(view: 'index', model: [userCO: userCO])
        }
    }
}
