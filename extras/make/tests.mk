#
# See ./CONTRIBUTING.rst
#

test.help:
	@echo '    Tests:'
	@echo ''
	@echo '        test                      Run all test'
	@echo '        test.lint                 Run all pre-commit'
	@echo '        test.lint.docker          Run all pre-commit in docker'
	@echo '        test.syntax               Run all syntax in code'
	@echo ''

test: clean
	make test.help

test.lint: clean
	pre-commit run --all-files --verbose

test.lint.docker: clean
	$(docker-compose) -f ${PATH_DOCKER_COMPOSE}/dev.yml \
		run --rm check bash -c "pre-commit run --all-files --verbose"

test.syntax: clean
	@echo $(MESSAGE) Running tests $(END)
