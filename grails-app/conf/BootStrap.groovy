import com.pg.accounts.Role
import com.pg.accounts.User
import com.pg.accounts.UserRole

class BootStrap {

    def init = { servletContext ->
        String adminAuthority = 'ROLE_ADMIN'
        User adminUser = User.findByUsername('uday')
        if (!adminUser) {
            adminUser = new User(username: 'uday', password: 'uday', enabled: true).save()
        }
        Role adminRole = Role.findOrSaveByAuthority(adminAuthority)
        UserRole.findOrSaveByUserAndRole(adminUser, adminRole)

    }
    def destroy = {
    }
}
