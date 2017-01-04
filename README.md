# Datalayer
Api / Logic layer of the application

## Deploy

Deploy is done with git push to master branch on aptible repo.
Familiarize yourself with [getting started](https://www.aptible.com/support/quickstart/java/jersey) in order to understand basics

* add remote origin for each environment [test, prod] consider suffixing each thus you have `aptible-test` `aptible-prod` origins to push to
* ensure you have all environment variables setup on apps see [toolbelt](https://www.aptible.com/support/toolbelt/) 

### Set up

1. Find repo for the app (look at aptible dashboard)
2. Add repository as a [remote](https://git-scm.com/book/en/v2/Git-Basics-Working-with-Remotes) branch  

        git remote add aptible-test git://aptible.io/someapp/somerepo
        git remote add aptible-prod git://aptible.io/someapp/somerepo

3. Do regular work with your origin on github and when you need to push your updates to test/prod just push / force push to aptible

        git push aptible-test your-branch:master # push to test
        git push aptible-prod master # push to prod

It is ok to force push to the remote in test/development
        git push -f aptible-test your-branch:master # push to test

### Environment overrides

_temp solution, app must use only environment variables to allow autonomous deploy/development_

In order to support `.properties` override `env.sh` file reads environment variables available on the box and writes to _overrides_ file before tomcat service is enabled (see `Procfile`). If one of the required environment variables is missing deploy will fail.

### Logs

Aptible supports [papertrail](https://papertrailapp.com/) log push. Use [toolbelt](https://www.aptible.com/support/toolbelt/) for logs.
