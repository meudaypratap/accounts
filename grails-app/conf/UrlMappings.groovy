class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/" {
            controller = 'login'
        }
        "/signup"{
            controller = 'home'
            action = 'signup'
        }
        "500"(view:'/error')
	}
}
