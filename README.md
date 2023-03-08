# sde
 Stock Dev Environment - Docker version

## Dependencies

 - Docker Desktop [https://www.docker.com/products/docker-desktop]
 - WSL2( on Windows ) [https://docs.microsoft.com/en-us/windows/wsl/install-win10]

## Getting Setup

### 1: Get local copy of sde

    git clone https://github.com/southernins/sde.git ./

Once cloned you are free to comment out any services in the docker-compose.yml file.

### 2: Get project code
Once the repository is cloned you cna create/clone your application into a folder inside the directory.

    git clone https://github.com/southernins/project-name.git ./project-folder

Alternatively you can use Github desktop to clone down the repo.


### 3: Configure SDE
Once the repository is cloned you can configure your development environment using a .env file inside this directory.  An example file `.env.example` is provided, just rename this file to `.env` and set the values as needed for your project.

For more details about Environment variables see [ENVRIONMENT DOCS](ENV_VARS.MD) 


###  4: Docker Startup 
start all ther services and containers in the compose file

    docker-compose build

    docker-compose up -d


### 5: Docker Stop

take down all services and containers in compose file

    docker-compose down


## Running Commands
information on commands and how to run them in a docker envrionment can be found here [COMMANDS](COMMANDS.MD)


## Updating SDE
to update your local install/clone of SDE to get any changes pushed out.

    git pull

To pull a specific version you can use
    
    git reset --hard <tag_name>
    git reset --hard v1


Following an update to SDE you need to rebuild containers.  This command has been the most complete.  It will ensure containers are recreated

    docker-compose up -d --build --remove-orphans --force-recreate

