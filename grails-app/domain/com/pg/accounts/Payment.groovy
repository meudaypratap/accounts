package com.pg.accounts

import groovy.transform.ToString

@ToString(includes = 'paidBy,receivedBy,amount', includeNames = true, includeFields = true)
class Payment {
    def springSecurityService

    User paidBy
    User receivedBy
    User createdBy
    Integer amount
    Date paymentDate
    Date dateCreated
    Date lastUpdated

    static constraints = {
        paidBy(nullable: false)
        receivedBy(nullable: false)
        amount(nullable: false, min: 1)
    }

    def beforeValidate() {
        Long loggedInUserId = springSecurityService.getPrincipal().id
        User user = User.get(loggedInUserId)
        createdBy = user
    }
}
