package com.bv.fn.myMoney

class HomeController {

    def springSecurityService

    def index() {}

    def signup() {
        User user = new User(params)
        user.enabled = true
        if (user.save()) {
            springSecurityService.reauthenticate(user.username)
            flash.message = "You are successfully registered."
            redirect(uri: '/')
        } else {
            render(view: '/login/auth', model: [user: user])
        }
    }
}
