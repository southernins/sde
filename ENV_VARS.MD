# Docker Environment Variables for SDE

here are some good practices when setting up the env variables for a project

### Project Naming
 set `COMPOSE_PROJECT_NAME` to the project code directory or project repo name.  This will provide better visibity/tracking of containers when multiple projects are running
  
### Port Configuration.
use a consistent pattern across port numbering.  you can set the first 2 digits for a project and us the last 2 to represent specific services 

__example__:  
> __Project A__  
>HTTP_PORT=8000  
>MAILHOG_PORT=8025    
>MEILISEARCH_PORT=8077

> __Project B__  
>HTTP_PORT=8100  
>MAILHOG_PORT=8125    
>MEILISEARCH_PORT=8177


## Environment Variables

#### COMPOSE_PROJECT_NAME

>Provides scope for containers and services created. Use project folder name   
>
>__example__: setting this value to __test__ will result in containers test.app, test.nginx...

#### HTTP_PORT

>Local Machine port that will be used to access this project  
>
>__example__: 8000  
> 
>__note__: this must be unique across running projects, as you cannot bind to the same address for multiple containers.

#### DB_DATABASE
>Create Database by this name.  
>
>__note__: this value will need to be used in the application .env or configuration

#### DB_USERNAME
>Username for created database user  
> 
>__note__: this value will need to be used in the application .env or configuration

#### DB_PASSWORD
>Password for created database user
> 
>__note__: this value will need to be used in the application .env or configuration

#### MAILHOG_PORT
>Local Machine Port used to access Meilisearch web interface
>
>__example__: 8025

#### MEILISEARCH_PORT
>Local Machine Port used to access Meilisearch web interface
>
>__example__: 8077

#### MEILISEARCH_KEY

>Master Key used to create Meilisearch instance  
>
>__default__: MeilisearchLocalDevelopment
>
>__note__: this value will need to be used in the application .env or configuration