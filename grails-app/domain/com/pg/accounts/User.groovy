package com.pg.accounts

class User {
    String name
    String username
    Date dateCreated
    Date lastUpdated

    static constraints = {
        name(shared: 'requiredChar')
        username(shared: 'requiredChar', unique: true)
    }

    String toString(){
        return username
    }
}
