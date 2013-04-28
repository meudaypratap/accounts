package com.pg.accounts

import org.springframework.dao.DataIntegrityViolationException

class FriendController {
    def springSecurityService

    def index() {
        User user = loggedInUser
        List<User> friends = user.fetchFriends()
        List<User> users = friends - user
        render view: 'index', model: [loggedInUser: user, friends: friends, users: users]
    }

    def search(String q, String max) {
        User user = loggedInUser
        params.max = Math.min(max ?: 10, 100)
        params.sort = params.sort ?: 'username'
        List<User> users = q ? User.findAllByUsernameIlikeAndIdNotEqual("%${q}%", user.id, params) : User.list(params)
        render view: 'index', model: [loggedInUser: user, users: users, friends: user.fetchFriends()]
    }

    def add(Long id) {
        User user = loggedInUser
        User friend = User.get(id)
        Friend friendShip = new Friend(createdBy: user, friend: friend)
        if (friendShip.save()) {
            flash.message = "Friend added successfully"
        } else {
            flash.error = "You cannot add this friend"
        }
        redirect(action: 'index')
    }

    def remove(Long id) {
        User user = loggedInUser
        User friend = User.get(id)
        Friend friendShip = Friend.findByCreatedByAndFriend(user, friend) ?: Friend.findByCreatedByAndFriend(friend, user)
        try {
            friendShip?.delete()
            flash.message = "Friend deleted successfully"
        } catch (DataIntegrityViolationException e) {
            flash.error = "You cannot delete this friend"
        }
        redirect(action: 'index')
    }

    private User getLoggedInUser() {
        Long loggedInUserId = springSecurityService.getPrincipal().id
        User user = User.get(loggedInUserId)
        return user
    }
}
