NAME = dw/collections-ui
VERSION = $(TRAVIS_BUILD_ID)
ME = $(USER)

all: build up

clean: stop rm
	sudo chown -R $(ME) nginx-conf nginx-html nginx-certs nginx-logs

build:
	docker build --no-cache . 
#	docker build --no-cache -t $(NAME):$(VERSION) . 

up:
	echo "setting up certificates"
	cp combined.pem nginx-certs/cert.pem
	cp key.pem nginx-certs/cert.key

	docker-compose up -d

	firefox https://beta.dina-web.net

stop:
	docker-compose stop

rm:
	docker-compose rm -vf

reload:
	docker exec -i dwcollectionsui_ui_1 nginx -s reload
