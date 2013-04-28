package com.pg.accounts

class HomeController {

    def index() {
        List<User> users = User.list([sort: 'username'])
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
        render(view: '/index', model: [users: users, userPayments: userPayments])
    }
}
