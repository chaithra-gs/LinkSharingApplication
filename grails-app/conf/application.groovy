grails {
    profile = 'web'
    codegen {
        defaultPackage = 'sample'
    }
    gorm {
        reactor {
            events = false
        }
    }
}

info {
    app {
        name = '@info.app.name@'
        version = '@info.app.version@'
        grailsVersion = '@info.app.grailsVersion@'
    }
}

spring {
    main {
        main['banner-mode'] = 'off'
    }
    groovy {
        template {
            template['check-template-location'] = false
        }
    }
}

endpoints {
    enabled = false
    jmx {
        enabled = true
    }
}

grails {
    mime {
        disable {
            accept {
                header {
                    userAgents = [
                        'Gecko',
                        'WebKit',
                        'Presto',
                        'Trident'
                    ]
                }
            }
        }
        types {
            all = '*/*'
            atom = 'application/atom+xml'
            css = 'text/css'
            csv = 'text/csv'
            form = 'application/x-www-form-urlencoded'
            html = [
                'text/html',
                'application/xhtml+xml'
            ]
            js = 'text/javascript'
            json = [
                'application/json',
                'text/json'
            ]
            multipartForm = 'multipart/form-data'
            pdf = 'application/pdf'
            rss = 'application/rss+xml'
            text = 'text/plain'
            hal = [
                'application/hal+json',
                'application/hal+xml'
            ]
            xml = [
                'text/xml',
                'application/xml'
            ]
        }
    }
    urlmapping {
        cache {
            maxsize = 1000
        }
    }
    controllers {
        defaultScope = 'singleton'
    }
    converters {
        encoding = 'UTF-8'
    }
    views {
        'default' {
            codec = 'html'
        }
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml'
            codecs {
                expression = 'html'
                scriptlets = 'html'
                taglib = 'none'
                staticparts = 'none'
            }
        }
    }
}

endpoints {
    jmx {
        jmx['unique-names'] = true
    }
}

hibernate {
    cache {
        queries = false
        use_second_level_cache = false
        use_query_cache = false
    }
}

dataSource {
    pooled = true
    jmxExport = true
    driverClassName =  'oracle.jdbc.OracleDriver'
    dialect = "org.hibernate.dialect.Oracle10gDialect"
    properties = oracleProperties

}

environments {
    development {
        dataSource {
            dbCreate = 'update'
            url = 'jdbc:oracle:thin:@127.0.0.1:1521/orcl';
//          properties = oracleProperties
            username = 'chaithra'
            password = 'chai'
        }
    }
    test {
        dataSource {
            dbCreate = 'update'
            url = 'jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE'

        }
    }
    production {
        dataSource {
            dbCreate = 'none'
            url = 'jdbc:h2:./prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE'
            properties {
                jmxEnabled = true
                initialSize = 5
                maxActive = 50
                minIdle = 5
                maxIdle = 25
                maxWait = 10000
                maxAge = 600000
                timeBetweenEvictionRunsMillis = 5000
                minEvictableIdleTimeMillis = 60000
                validationQuery = 'SELECT 1'
                validationQueryTimeout = 3
                validationInterval = 15000
                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = false
                jdbcInterceptors = 'ConnectionState'
                defaultTransactionIsolation = 2
            }
        }
    }
}


server.port = 8090