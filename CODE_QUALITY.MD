# Code Quality
notes and helper commands for Code Quality Tools




## Sonarqube

### Run Local Sonarqube server

to spin up a local Sonarqube server for testing run the following

    docker run -d --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p 9000:9000 sonarqube:latest



### Scan/Analyse code locally

    docker run --rm --network="host" -e SONAR_HOST_URL="http://localhost:9000" -e SONAR_LOGIN="54a44fc6d193f08a2866fb6fc93fdb87937aa8e9" -v "${PWD}:/usr/src" sonarsource/sonar-scanner-cli -Dsonar.projectKey=omega
    
    
## PHPQA


docker run --init -it --rm -v "$(pwd):/project" -w /project jakzal/phpqa:php7.4




TODO:: look into https://github.com/sds/overcommit