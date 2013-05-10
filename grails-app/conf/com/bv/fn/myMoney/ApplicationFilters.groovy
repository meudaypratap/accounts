package com.bv.fn.myMoney

class ApplicationFilters {

    def grailsApplication

    def filters = {
        logging(controller: '*', action: '*') {
            before = {
                log.info(params.findAll { !(it.key in grailsApplication.config.grails.exceptionresolver.params.exclude) })
            }
        }

        consoleImports(controller: 'console', action: '*') {
            before = {
                String importStatements = "import ${grailsApplication.config.grails.project.groupId}.*"

                session['_grails_console_last_code_'] = session['_grails_console_last_code_'] ?: importStatements
            }
        }
    }
}
