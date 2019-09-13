#
# See ./CONTRIBUTING.rst
#

FILE_README=$(ROOT_DIR)/README.rst

docs:
	make docs.help

docs.help:
	@echo '    Docs:'
	@echo ''
	@echo '        docs.show                  Show restview README'
	@echo '        docs.make                  Make documentation html'
	@echo ''

docs.show: clean
	$(PIPENV_RUN) restview "${FILE_README}"

docs.make.html: clean
	docker-compose run --rm docs bash -c "cd docs && make html"
