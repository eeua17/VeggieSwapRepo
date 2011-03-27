dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver" 
    username = "rach" 
    password = "veggiepass" 
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost/veggieswap" 
        }
    }
    test {
        dataSource {
            dbCreate = "update" 
            url = "jdbc:mysql://localhost/veggieswap" 
        }
    }
    production {
        dataSource {
            dbCreate = "update" 
            url = "jdbc:mysql://localhost/veggieswap" 
        }
    }
}