# Docker Environment Variables for SDE

here are some good practices when setting up the env variables for a project

### Project Naming
 set `COMPOSE_PROJECT_NAME` to the project code directory or project repo name.  This will provide better visibity/tracking of containers when multiple projects are running
  
### Port Configuration.
use a consistent pattern across port numbering.  you can set the first 2 digits for a project and us the last 2 to represent specific services 

__example__:  
__Project A__  
HTTP_PORT=8000  
MAILHOG_PORT=8025    
MEILISEARCH_PORT=8077

__Project B__  
HTTP_PORT=8100  
MAILHOG_PORT=8125    
MEILISEARCH_PORT=8177

__note__: Ports must be unique across all running projects. You cannot bind to the same host port for multiple containers.

## Environment Variables

<dl>

  <dt>COMPOSE_PROJECT_NAME</dt>
  <dd>
  Provides scope for containers and services created. Use project folder name   

  __example__: setting this value to __test__ will result in containers test.app, test.nginx...
  </dd>

  <dt>HTTP_PORT</dt>
  <dd>
  Local Machine port that will be used to access this project  

  __example__: 8000
  </dd>

  <dt>MYSQL_PORT</dt>
  <dd>
  Local Machine port that will be used to access project database

  __example__: 8036
  </dd>

  <dt>DB_DATABASE</dt>
  <dd>
  Create Database by this name.  

  __note__: this value will need to be used in the application .env or configuration
  </dd>

  <dt>DB_USERNAME</dt>
  <dd>
  Username for created database user  

  __note__: this value will need to be used in the application .env or configuration
  </dd>

  <dt>DB_PASSWORD</dt>
  <dd>
  Password for created database user

  __note__: this value will need to be used in the application .env or configuration
  </dd>

  <dt>MAILHOG_PORT</dt>
  <dd>
  Local Machine Port used to access Meilisearch web interface

  __example__: 8025
  </dd>

  <dt>MEILISEARCH_PORT</dt>
  <dd>
  Local Machine Port used to access Meilisearch web interface

  __example__: 8077
  </dd>

  <dt>MEILISEARCH_KEY</dt>
  <dd>
  Master Key used to create Meilisearch instance  

  __default__: MeilisearchLocalDevelopment

  __note__: this value will need to be used in the application .env or configuration
  </dd>
</dl>

