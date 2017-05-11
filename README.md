# collections-ui-docker

Integration project to provide a Collections Management web UI that works against the DINA-Web Collections REST API

# Dependencies

For `make up` to work the system needs to have `docker`, `docker-compose` and `make` installed.

# Usage

To start and bring up services:
		make up

To stop and remove:
		make clean

To reload the webserver configuration:
		make reload


# Gotcha

For testing locally, remember to add something like `beta-cm.dina-web.net` to your /etc/hosts file...

Good luck!
