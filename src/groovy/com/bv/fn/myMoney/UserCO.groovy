package com.bv.fn.myMoney

import grails.validation.Validateable

@Validateable
class UserCO {

    String oldPassword
    String newPassword
    String email
    User user

    static constraints = {
        importFrom User, include: ['email']
        user(nullable: false)
        oldPassword(validator: { val, obj ->
            if (val && !obj.user?.validatePassword(val)) {
                return 'invalid.old.password'
            }
        })
    }
}
