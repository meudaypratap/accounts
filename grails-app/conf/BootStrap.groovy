import com.bv.fn.moneyEye.Role
import com.bv.fn.moneyEye.User
import com.bv.fn.moneyEye.UserRole

class BootStrap {

    def init = { servletContext ->
        String adminAuthority = 'ROLE_ADMIN'
        User adminUser = User.findByUsername('admin')
        if (!adminUser) {
            adminUser = new User(username: 'admin', password: 'admin', enabled: true).save()
        }
        Role adminRole = Role.findOrSaveByAuthority(adminAuthority)
        UserRole.findOrSaveByUserAndRole(adminUser, adminRole)

    }
    def destroy = {
    }
}
