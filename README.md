# Overview

* `./init.sh` - creates directories with correct permissions
* `docker-compose up -d db jenkins sonarqube` - runs containers in the background
* Go over `Jenkins` and `SonarQube` configure them
* Update the `shields` environment variables
* `docker-compose up -d shields` 

## Jenkins

Go to `http://localhost:18081/`

* `docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword`
* `Install default plugins`
* User: `root`
* Pass: `password`
  
### Jenkins Security

Go to `http://localhost:18081/configureSecurity/`

* `Authorization` -> `Project-based Matrix Authorization Strategy`
* `Anonymous Users` -> no permissions
* `Authenticated Users` -> `Overall -> Read`

Go to `http://localhost:18081/user/root/configure`

* `API TOKEN` -> `Add new token named shields` 
* Update the `shields#JENKINS_PASS` environment variable in `docker-compose.yml`

### Jenkins Pipeline Job

* Create `testing-pipe` pipeline with script:
  ```
  pipeline {
      agent { label "master" }
      stages {
          stage('Hello') {
              steps {
                  echo 'Hello World'
              }
          }
      }
  }
  ```

## Shields

Go to `http://localhost`

* Search for Jenkins
* Select `build` (not tests)
* Paste `job url` - `http://jenkins:8080/job/testing-pipe/`
* Have fun.

