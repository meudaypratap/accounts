package com.pg.accounts

import groovy.transform.ToString

@ToString(includes = 'paidBy,amount,title,users', includeNames = true, includeFields = true)
class Expense {
    def springSecurityService

    String title
    Integer amount
    User paidBy
    User createdBy
    Date expenseDate
    Date dateCreated
    Date lastUpdated

    static hasMany = [users: User]

    static constraints = {
        title(shared: 'requiredChar')
        amount(nullable: false, min: 1)
        paidBy(nullable: false)
        users(nullable: false, minSize: 1)
    }

    def beforeValidate() {
        Long loggedInUserId = springSecurityService.getPrincipal().id
        User user = User.get(loggedInUserId)
        createdBy = user
    }
}
