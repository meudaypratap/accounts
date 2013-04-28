package com.pg.accounts

class Friend {

    static belongsTo = [createdBy: User, friend: User]

    static constraints = {
        createdBy unique: 'friend', validator: { val, obj ->
            if (val?.id == obj.friend?.id) {
                return 'createdBy.friend.not.equal'
            }
        }
    }

    static mapping = {
        createdBy fetch: 'join'
        friend fetch: 'join'
    }
}
