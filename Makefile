
#Server
migration:
	cd wallpaperpod_server && serverpod create-migration
# Flutter app
run:
	cd wallpaperpod_flutter && flutter run

#Docker run
run-docker:
	cd wallpaperpod_server && docker compose up --build --detach && dart bin/main.dart --apply-migrations