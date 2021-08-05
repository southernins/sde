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
Once the repository is cloned you can configure your development environment using the .env file inside this directory

for more details about Environ variables and how they are used see the [ENVRIONMENT DOCS](ENV_VARS.MD) 


###  4: Docker Startup 
start all ther services and containers in the compose file

    docker-compose build

    docker-compose up -d


### 5: Docker Stop

take down all services and containers in compose file

    docker-compose down

## Running Commands
information on commands and how to run them in a docker envrionment can be found here [COMMANDS](COMMANDS.MD)

