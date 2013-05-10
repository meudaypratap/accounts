import com.bv.fn.myMoney.Role
import com.bv.fn.myMoney.User
import com.bv.fn.myMoney.UserRole

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
