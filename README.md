
# Grails Petclinic Sample Application

This clickstart is a lightweight customization of the [Grails Petclinic Sample Application](https://github.com/grails-samples/grails-petclinic) maintained byt the Grails Community.

Press the button to build, test and deploy this instantly:

<a href="https://grandcentral.cloudbees.com/?CB_clickstart=https://raw.github.com/Cloudbees-community/grails-petclinic-clickstart/master/clickstart.json"><img src="https://d3ko533tu1ozfq.cloudfront.net/clickstart/deployInstantly.png"/></a>




# Manual setup on CloudBees

Instructions for a manual setup with the [CloudBees SDK](http://wiki.cloudbees.com/bin/view/RUN/BeesSDK).

## Create a Tomcat6 container

```
bees app:create -a community/grails-petclinic-clickstart jvmPermSize=128
```

Please not the extra `jvmPermSize` for Grails framrwork.


## Create a MySQL Database

```
bees db:create community/grails-petclinic-clickstart
```

## Bind the MySQL Database to the Tomcat container

```
bees app:bind -a community/grails-petclinic-clickstart -db community/grails-petclinic-clickstart -as grails_petclinic
```

This binding injects in the container:

* System properties
  * `DATABASE_URL_GRAILS_PETCLINIC` starting with `mysql:` (e.g. "mysql://ec2-x-y-z-w.compute-1.amazonaws.com:3306/grails-petclinic-clickstart")
  * `DATABASE_USERNAME_GRAILS_PETCLINIC`
  * `DATABASE_PASSWORD_GRAILS_PETCLINIC`
* a JNDI datasource `java:comp/env/jdbc/grails_petclinic`

More details on [RUN@cloud >> Binding services (resources) to applications](http://wiki.cloudbees.com/bin/view/RUN/Resource+Management)



# Notes

List of changes between the official Grails PetClinic application and is adaptation: 


* Addition of MySQL JDBC Driver dependency (see [BuildConfig.groovy](https://github.com/CloudBees-community/grails-petclinic-clickstart/blob/037f96d46de52e5c4e1b1a3aa50254e51ecdcebd/grails-app/conf/BuildConfig.groovy#L21))
* Declaration of MySQL DataSources 
  * JNDI DataSource for "production" environment (see [DataSource.groovy](https://github.com/CloudBees-community/grails-petclinic-clickstart/blob/12352383ef1587f1d448f521f718ebb1fd5fb9b1/grails-app/conf/DataSource.groovy#L60))
  * Embedded Grails Data Source using configuration injected by System Properties  for a "embeddedDatabase" environment (see [DataSource.groovy](https://github.com/CloudBees-community/grails-petclinic-clickstart/blob/12352383ef1587f1d448f521f718ebb1fd5fb9b1/grails-app/conf/DataSource.groovy#L32))
* Add info jsps.

All changes are visible [here](https://github.com/CloudBees-community/grails-petclinic-clickstart/pull/new/grails-samples:master...master).

***
***

ORIGINAL README.md OF THE GRAIL PETCLINIC APPLICATION BELOW

***
***



# Petclinic Sample Application

This is the standard introductory sample application for Grails. To get started with it, simply clone the repository and then from within your local copy run:

    ./grailsw run-app

on Unix-like systems, or

    grailsw run-app

on Windows via the command prompt. Once the server has started up, you can copy the URL and paste it in a browser.

Follow the tutorial link to learn about Grails or click on the View Source for Controller/View links to see the underlying code for whatever page you are currently on.
