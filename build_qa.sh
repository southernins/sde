docker build -t southernins/phpqa ./containers/phpqa

#alias sdeqa='docker run --init -it --rm -v "$(pwd):/project" -w /project southernins/phpqa'
### This image needs to connect to the app-net so it can find the database host during testing