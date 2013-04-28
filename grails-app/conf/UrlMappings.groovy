class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?" {
            constraints {
                // apply constraints here
            }
        }

        "/" {
            controller = 'login'
        }
        "/search" {
            controller = 'friend'
            action = 'search'
        }
        "500"(view: '/error')
    }
}
