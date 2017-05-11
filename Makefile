VERSION = $(TRAVIS_BUILD_ID)
ME = $(USER)

all: up

clean: stop rm
	sudo chown -R $(ME) nginx-conf nginx-html nginx-certs nginx-logs

up:
	docker-compose up -d

stop:
	docker-compose stop

rm:
	docker-compose rm -vf

reload:
	docker exec -i collectionsuidocker_ui_1 nginx -s reload
