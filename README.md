# dw-collections-ui

Integration project to provide a Collections Management web UI that works against the DINA-Web Collections REST API

# Dependencies

For `make up` to work the system needs to have `docker` and `docker-compose` installed.

# Usage

To start and bring up services:
		make up

To stop and remove:
		make clean

To reload the webserver configuration:
		make reload


# TODO Configuration

First, set up the "connection" ie address to the DINA-Web Collections REST API backend.

Then put the apps static html in the `nginx-static` directory, do this manually for now... 

This should later on become part of the `make build`, getting the latest stable release from GitHub Releases using `wget` or so...

# Certificates and setting up SSL

You may have three files available:

		key.pem - your secret key originally used in your Certificate Signing Request
		cacert.pem - the Certificate Authority's chain of certs
		cert.pem - your signed (wildcard?) public cert

If so, then combine the last two files - the cacert.pem och cert.pem - into `combined.pem`.

The Makefile uses the `combined.pem` and the  `key.pem` to configure the nginx webserver (see `ui.conf` for details).

# Gotcha

For testing locally, remember to add something like `beta.dina-web.net` to your /etc/hosts file...

Good luck!
