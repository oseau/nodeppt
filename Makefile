.PHONY: dev
dev: ## start a dev docker
	@echo "start dev!"
	@docker run -it --rm --name ppt -v $(shell pwd):/ppt -w /ppt -p 8080:8080 node:10.16.3-jessie /bin/bash

.PHONY: login
login: ## login dev docker
	@echo "login!"
	@docker exec -it ppt /bin/bash

# Absolutely awesome: http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
