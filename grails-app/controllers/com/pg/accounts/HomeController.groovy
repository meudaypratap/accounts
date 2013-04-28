package com.pg.accounts

class HomeController extends ApplicationController {

    def index() {
        User user = getLoggedInUser()

        List<User> users = user.fetchFriends()
        Map<User, List<Integer>> userPayments = [:]
        users.each { User receiver ->
            List paymentAmounts = []
            List<Expense> expenses = Expense.findAllByPaidBy(receiver)
            users.each { User payer ->
                List<Expense> payerExpenses = expenses.findAll { it.users.contains(payer) }
                Integer expenseAmount = 0
                payerExpenses.each { Expense expense ->
                    expenseAmount += expense.amount / expense.users.size()
                }
                Integer paymentAmount = Payment.createCriteria().get {
                    projections {
                        sum('amount')
                    }
                    eq('paidBy', payer)
                    eq('receivedBy', receiver)
                } ?: 0
                paymentAmounts.add(expenseAmount - paymentAmount)
            }
            userPayments[receiver] = paymentAmounts
        }
        render(view: 'index', model: [users: users, userPayments: userPayments])
    }

    def changePassword() {}

    def updatePassword(String oldPassword, String newPassword) {
        User user = getLoggedInUser()
        if (springSecurityService.encodePassword(oldPassword) == user.password) {
            user.password = newPassword
            flash.message = "Password updated successfully"
        } else {
            flash.error = "Invalid old password"
        }
        redirect(action: 'changePassword')
    }

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
