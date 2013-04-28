package com.pg.accounts

import groovy.transform.ToString

@ToString(includes = 'paidBy,receivedBy,amount', includeNames = true, includeFields = true)
class Payment {

    User paidBy
    User receivedBy
    Integer amount
    Date dateCreated
    Date lastUpdated

    static constraints = {
        paidBy(nullable: false)
        receivedBy(nullable: false)
        amount(nullable: false, min: 1)
    }
}
