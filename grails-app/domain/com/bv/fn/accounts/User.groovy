package com.bv.fn.accounts

import org.springframework.security.core.context.SecurityContextHolder as SCH

class User {

    transient springSecurityService

    String username
    String email
    String password
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    Date dateCreated
    Date lastUpdated

    static constraints = {
        username blank: false, unique: true
        password blank: false, password: true
        email blank: true, nullable: true, email: true, unique: true
    }

    static mapping = {
        password column: '`password`'
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }

    static User getLoggedInUser() {
        Long userId = SCH.context?.authentication?.principal?.id
        return userId ? User.get(userId) : null
    }

    Boolean validatePassword(String password){
       return springSecurityService.encodePassword(this.password) == password
    }

    String toString() {
        return username
    }
}
