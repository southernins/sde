# Docker Envrionment Variables for SDE


#### COMPOSE_PROJECT_NAME

>provides scope for containers and services created. Use project folder name   
>
>__example__: given the project created by `git clone https://github.com/southernins/test.git ./` set the value to __"test"__

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