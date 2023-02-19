.DEFAULT_GOAL := tests
.PHONY: deps test fmt lint pub img
NAME := aba

deps:
	composer install

fmt:
	./vendor/bin/pint

lint:
	phpcbf src
	phpcs src

test:
	 ./vendor/bin/pest

pub:
	composer update
	composer validate

img:
	podman build --file ./Dockerfile --tag ${USER}/${NAME}:$(shell cat .version)
