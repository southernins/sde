#test alias
alias testa='ps -aux'
alias testb='ls -liah --color=auto'
alias phpqa='docker run --init -it --rm -v "$(pwd):/project" -w /project jakzal/phpqa:php7.4'
alias phpmd='phpqa phpmd ./app text ./phpmd.xml'
alias phpcpd='phpqa phpcpd ./app'