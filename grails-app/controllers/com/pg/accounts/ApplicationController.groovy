package com.pg.accounts

class ApplicationController {
    def springSecurityService

    User getLoggedInUser() {
        Long loggedInUserId = springSecurityService.getPrincipal().id
        User user = User.get(loggedInUserId)
        return user
    }
}
