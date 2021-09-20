#####
# Alias file
#
# System Aliases
#################
alias testa='ps -aux'
alias testb='ls -liah --color=auto'
alias count='find . -type f | wc -l'
#
#
# Code Quality
alias phpqa='docker run --init -it --rm -v "$(pwd):/project" -v "$(pwd)/../qa-reports:/tmp" -w /project jakzal/phpqa:php7.4'
alias phpmd='phpqa phpmd ./app text ./phpmd.xml'
alias phpcpd='phpqa phpcpd ./app'
alias pdepend='phpqa pdepend --summary-xml=/tmp/summary.xml  --jdepend-chart=/tmp/jdepend.svg --overview-pyramid=/tmp/pyramid.svg ./app'
alias phploc='phpqa phploc ./app'







