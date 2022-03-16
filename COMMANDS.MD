information and examples of command usage for projects build on the Stock Dev Environment.

## Command Reference

## Docker Commands

### Using Service Containers provided by SDE
The commands provided in the section use service containers provided by SDE and must be run inside the root project folder. (same directory as the file docker-compose.yml)

Here is the command structure.

    docker-compose run --rm <service_name> <command>

**--rm** - adding this tells docker to automatically clean up the resulting container once the command/service has run.  Leave this off if you need to review the results or logs of the container.

**Artisan**

    docker-compose run --rm artisan list
    docker-compose run --rm artisan test
    docker-compose run --rm artisan omega:index


**NPM**

    docker-compose run --rm npm run dev
    docker-compose run --rm npm run production
    docker-compose run --rm npm install
    docker-compose run --rm npm upgrade


**Composer**

    docker-compose run --rm composer install
    docker-compose run --rm composer install --no-dev
    docker-compose run --rm composer upgrade


**Build**  
Custom container service to build deployment packages.  this is a wrapper for artisan build commands the correctly sets the application context.  allowing build files to be put in the current directory.


    docker-compose run --rm build --env=production
    docker-compose run --rm build --env=staging


### Execute commands inside a running container/image

This is docker's way of executing commands inside a given container and can be run in the directory relavent to the piticular command

    docker exec -it <image_name> <command>

these examples assume the Docker-Compose ENV variable `COMPOSE_PROJECT_NAME=test`

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