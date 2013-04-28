dataSource {
    pooled = true
    driverClassName = 'org.h2.Driver'
    username = 'sa'
    password = ''
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
    format_sql = true
    use_sql_comments = true
}

environments {
    development {
        dataSource {
            dbCreate = 'update' // one of 'create', 'create-drop', 'update', 'validate', ''
            driverClassName = "com.mysql.jdbc.Driver"
            dialect = 'org.hibernate.dialect.MySQL5InnoDBDialect' // must be set for transactions to work!
            username = "root"
            password = "igdefault"
            url = "jdbc:mysql://localhost:3306/accounts?autoReconnect=true&useUnicode=yes&characterEncoding=UTF-8"
        }
    }
    test {
        dataSource {
            dbCreate = 'update'
            url = 'jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000'
        }
    }
    embeddedDataSource {
        dataSource {
            pooled = true
            dbCreate = 'create-drop'
            url = "jdbc:" + System.getProperty('DATABASE_URL_GRAILS_PETCLINIC')
            driverClassName = "com.mysql.jdbc.Driver"
            dialect = 'org.hibernate.dialect.MySQL5InnoDBDialect'
            username = System.getProperty('DATABASE_USERNAME_GRAILS_PETCLINIC')
            password = System.getProperty('DATABASE_PASSWORD_GRAILS_PETCLINIC')
            properties {
                maxActive = 20
                maxIdle = 1
                maxWait = 10000

                removeAbandoned = true
                removeAbandonedTimeout = 60
                logAbandoned = true

                validationQuery = "SELECT 1"
                testOnBorrow = true
            }
        }
    }
    production {
        dataSource {
            dialect = 'org.hibernate.dialect.MySQL5InnoDBDialect'
            pooled = false
            dbCreate = 'create-drop'
            jndiName = 'java:comp/env/jdbc/grails_petclinic'
        }
    }
}
