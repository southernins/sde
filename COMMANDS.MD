## Command Reference
information and examples of command usage for projects build on the Stock Dev Environment.


## Docker Commands

### Using Service Containers provided by SDE

    docker-compose run <service_name> <command>

**Artisan**

    docker-compose run artisan list
    docker-compose run artisan test
    docker-compose run artisan omega:index


**NPM**

    docker-compose run npm run dev
    docker-compose run npm run production
    docker-compose run npm install
    docker-compose run npm upgrade


**Composer**

    docker-compose run composer install
    docker-compose run composer install --no-dev
    docker-compose run composer upgrade


**Build**  
Custom container service to build deployment packages.  this is a wrapper for artisan build commands the correctly sets the application context.  allowing build files to be put in the current directory.


    docker-compose run build --env=production
    docker-compose run build --env=staging


### Execute commands inside a running container/image

    docker exec -it <image_name> <command>

these examples assume the ENV variable `COMPOSE_PROJECT_NAME=test`

**Run bash**

    docker exec -it test.app bash


**Migrate Database**

    docker exec -it test.app php artisan migrate --seed


**Index Search**

    docker exec -it test.app php artisan omega:index


**Run Build Command**

    docker exec -it test.app php artisan build --env=production


**Running tests**

    docker exec -it test.app php artisan test


### Docker Startup
containers will need to be built before starting, and rebuilt if changes are made to container files.

build and start as two separate commands

    docker-compose build
    docker-compose up -d


build and start in one combined command

    docker-compose up -d --build


building without cached elements is useful if you are working on the container files themselves.

    docker-compose build --no-cache 