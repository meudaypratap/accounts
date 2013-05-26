class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/" (view:'index')
        "/signup"{
            controller = 'home'
            action = 'signup'
        }
        "500"(view:'/error')
	}
}
